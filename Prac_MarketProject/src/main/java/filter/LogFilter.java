package filter;

import java.io.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LogFilter implements Filter {
	
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
		System.out.println("디버깅 메시지 : GameMuseum-로그파일 필터 실행.");
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
		System.out.println("디버깅 메시지 : 로그파일 필터 수행.");
		
		System.out.println("접속한 클라이언트 IP : "+request.getRemoteAddr());
		long start = System.currentTimeMillis();
		System.out.println("접근한 URL 경로 : " + getURLPath(request));
		System.out.println("요청 처리 시작 시간 : " + getNow());
		filterChain.doFilter(request, response);
		
		long end = System.currentTimeMillis();
		System.out.println("요청 처리 시작 시간 : " + getNow());
		System.out.println("요청 처리 소요 시간 : " + (end-start) + "ms");
		System.out.println("===========구분선===========");
	}
	
	public void destroy() {
		System.out.println("디버깅 메시지 : GameMuseum-로그필터 해제");
	}
}
