package filter;

import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

public class LogFileFilter implements Filter {
	
	PrintWriter printWriter;
	
	private String getURLPath(ServletRequest request) {
		HttpServletRequest req;
		String currentPath = "";
		String queryString = "";
		if(request instanceof HttpServletRequest) {
			req = (HttpServletRequest) request;
			currentPath = req.getRequestURI();
			queryString = req.getQueryString();
			queryString = queryString == null ? "" : "?" + queryString;
		}
		return currentPath + queryString;
	}
	
	private String getNow() {
		DateFormat formatter = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(System.currentTimeMillis());
		return formatter.format(cal.getTime());
	}
	
	public void init(FilterConfig filterConfig) throws ServletException {
		
		System.out.println("디버깅 메시지 : 로그파일 필터 실행.");
		
		String filename = filterConfig.getInitParameter("filename");
		if(filename==null) throw new ServletException("로그 파일을 찾을 수 없습니다.");
		try {
			printWriter = new PrintWriter(new FileWriter(filename, true), true);
		} catch (IOException e) {
			throw new ServletException("로그 파일을 열 수 없습니다.");
		}
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
		System.out.println("디버깅 메시지 : 로그파일 필터 수행.");
		printWriter.printf("접속한 클라이언트 IP : %s %n", request.getRemoteAddr());
		printWriter.printf("접근한 URL 경로 : %s %n", getURLPath(request));
		long start = System.currentTimeMillis();
		printWriter.printf("요청 처리 시작 시간 : %s %n", getNow());
		
		filterChain.doFilter(request, response);
		
		long end = System.currentTimeMillis();
		printWriter.printf("요청 처리 종료 시간 : %s %n", getNow());
		printWriter.printf("요청 처리 소요 시간 : %s ms%n", (end - start));
		String contentType = response.getContentType();
		printWriter.printf("요청 보낸 문서의 콘텐츠 유형 : %s %n", contentType);
		printWriter.println("===========구분선===========");
	}
	
	public void destroy() {
		printWriter.close();
		System.out.println("디버깅 메시지 : 로그파일 필터 해제");
	}
}
