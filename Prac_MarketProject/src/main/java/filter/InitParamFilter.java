package filter;

import java.io.*;

import javax.servlet.*;

public class InitParamFilter implements Filter {
	private FilterConfig filterConfig = null;
	
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("디버깅 메시지 : 필터 2 실행");
		this.filterConfig = filterConfig;
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
		System.out.println("디버깅 메시지 : 필터 2 수행");
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		System.out.println("필터2에서 받은 id : "+id);
		String pw = request.getParameter("pw");
		System.out.println("필터2에서 받은 pw : "+pw);
		
		String param1 = filterConfig.getInitParameter("param1");
		String param2 = filterConfig.getInitParameter("param2");
		
		String message;
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		if(id.equals(param1) && pw.equals(param2)) {
			message = "로그인 성공.";
		} else {
			message = "로그인 실패.";
		}
		
		request.setAttribute("msg", message);
		filterChain.doFilter(request, response);
	}
	
	public void destroy() {
		System.out.println("디버깅 메시지 : 필터 2 해제");
	}
}
