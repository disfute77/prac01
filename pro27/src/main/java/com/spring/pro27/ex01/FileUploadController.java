package com.spring.pro27.ex01;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class FileUploadController {
    // 이미지 파일이 저장될 경로
	private static String CURR_IMAGE_REPO_PATH = "E:\\spring\\image_repo";
	
	// 업로드 폼을 반환하는 메서드
	@RequestMapping(value="/form")
	public String form() {
		return "test/uploadForm"; // 업로드 폼 뷰 이름 반환
	}
	
	// 파일 업로드 처리 메서드
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public ModelAndView upload(MultipartHttpServletRequest mpRequest,
							   HttpServletResponse response) throws Exception {
		mpRequest.setCharacterEncoding("utf-8"); // 요청 인코딩 설정
		Map map = new HashMap(); // 파라미터를 저장할 맵 생성
		Enumeration enu = mpRequest.getParameterNames(); // 요청 파라미터 이름을 가져옴
		while(enu.hasMoreElements()) {
			String name = (String) enu.nextElement(); // 파라미터 이름
			String value = mpRequest.getParameter(name); // 파라미터 값
			map.put(name, value); // 맵에 파라미터 추가
		}
		List fileList = fileProcess(mpRequest); // 파일 처리 메서드 호출
		map.put("fileList", fileList); // 파일 리스트를 맵에 추가
		ModelAndView mav = new ModelAndView(); // ModelAndView 객체 생성
		mav.addObject("map", map); // 모델에 맵 추가
		mav.setViewName("test/result"); // 결과 뷰 이름 설정
		return mav; // ModelAndView 반환
	}
	
	// 파일을 처리하는 메서드
	private List<String> fileProcess(MultipartHttpServletRequest mpRequest) throws Exception {
		List<String> fileList = new ArrayList<String>(); // 파일 이름을 저장할 리스트
		Iterator<String> fileNames = mpRequest.getFileNames(); // 업로드된 파일 이름을 가져옴
		while(fileNames.hasNext()) {
			String fileName = fileNames.next(); // 파일 이름
			MultipartFile mFile = mpRequest.getFile(fileName); // MultipartFile 객체 가져옴
			String originFileName = mFile.getOriginalFilename(); // 원본 파일 이름
			
//			if(originFileName.equals("")) originFileName="default-image.png";
//			파일 첨부를 안하면 파일이름이 공백으로 뜨는데 그때 파일이름을 오류시띄울이미지로 강제지정.
			
			if(originFileName.equals("")) continue;
//			파일 첨부를 안하면 아예 안띄워버림.
//			현재 방식은 파일첨부를 누르면 자동으로 다음 파일첨부버튼이 나타나기때문에 파일첨부안되면 그냥 안띄워버리는게 맞음.

			fileList.add(originFileName); // 파일 리스트에 원본 파일 이름 추가
			File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName); // 저장할 파일 객체 생성
			if(mFile.getSize() != 0) { // 파일 크기가 0이 아닐 경우
				if(!file.exists()) { // 파일이 존재하지 않으면
					if(file.getParentFile().mkdirs()) { // 부모 디렉토리 생성
						file.createNewFile(); // 새 파일 생성
					}
				}
				// 파일을 지정된 경로로 전송
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + originFileName));
			}
		}
		return fileList; // 파일 리스트 반환
	}
	
	@RequestMapping("/download")
	protected void download(@RequestParam("imageFileName") String imageFileName, HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = CURR_IMAGE_REPO_PATH + "\\" + imageFileName;
		File file = new File(downFile);
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + imageFileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while(true) {
			int count = in.read(buffer);
			if(count == -1) break;
			out.write(buffer, 0 , count);
		}
		in.close(); out.close();
	}
	
	
	@RequestMapping("/downloadT")
	protected void downloadT(@RequestParam("imageFileName") String imageFileName, HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath = CURR_IMAGE_REPO_PATH + "\\" + imageFileName;
		File image = new File(filePath);
		int lastIndex = imageFileName.lastIndexOf(".");
		String fileName = imageFileName.substring(0, lastIndex);
		File thumbnail = new File(CURR_IMAGE_REPO_PATH + "\\" + "thumbnail" + "\\" + fileName + ".png");
		if (image.exists()) {
			thumbnail.getParentFile().mkdirs();
			Thumbnails.of(image).size(50, 50).outputFormat("png").toFile(thumbnail);
		}
		
		FileInputStream in = new FileInputStream(thumbnail);
		byte[] buffer = new byte[1024*8];
		while (true) {
			int count = in.read(buffer);
			if (count == -1) break;
			out.write(buffer, 0, count);
		}
		in.close(); out.close();
	}
	
	@RequestMapping("/downlaodT2")
	protected void downloadT2(@RequestParam("imageFileName") String imageFileName, HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath = CURR_IMAGE_REPO_PATH + "\\" + imageFileName;
		File image = new File(filePath);
		int lastIndex = imageFileName.lastIndexOf(".");
		String fileName = imageFileName.substring(0, lastIndex);
		File thumbnail = new File(CURR_IMAGE_REPO_PATH + "\\" + "thumbnail" + "\\" + fileName + ".png");
		if (image.exists()) {
			Thumbnails.of(image).size(50, 50).outputFormat("png").toOutputStream(out);
		} else {
			return;
		}
		byte[] buffer = new byte[1024*8];
		out.write(buffer); out.close();
	}
	
}
