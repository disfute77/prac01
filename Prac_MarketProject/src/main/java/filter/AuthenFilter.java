package filter;

import java.io.*;
import javax.servlet.*;

public class AuthenFilter implements Filter {
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("AuthenFilter 초기화...");
		System.out.println("여기에 필터시작시 필요한 자원 생성 가능");
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
		System.out.println("AuthenFilter 수행.");
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		System.out.println("필터에서 받은 것은 "+name+"임.");
		if(name==null || name.equals("")) {
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter printWriter = response.getWriter();
			String message = "입력된 name 값은 null 입니다.";
			printWriter.println(message);
			return;
		}
		filterChain.doFilter(request, response);
	}
	
	public void destroy() {
		System.out.println("AuthenFilter 해제.");
		System.out.println("여기에서 생성했던 자원 등 종료시킬 수 있음");
	}
}
