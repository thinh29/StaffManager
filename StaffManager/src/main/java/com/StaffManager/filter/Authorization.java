package com.StaffManager.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Authorization implements Filter {
	@SuppressWarnings("unused")
	private ServletContext context;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.context = filterConfig.getServletContext();
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		String url = request.getRequestURI();
		if (url.equals("/") || url.startsWith("/login")) {
			int accept = 5;
			int type = 5;
			do {
				if (request.getSession().getAttribute("accept_" + type) != null) {
					accept = 0;
				} else {
					accept--;
					type--;
				}
			} while (accept > 0);
			switch (type) {
			case 1:
				response.sendRedirect(request.getContextPath() + "/admin");
				break;
			case 2:

				break;
			case 3:
				response.sendRedirect(request.getContextPath() + "/manager");
				break;
			case 4:

				break;
			case 5:
				response.sendRedirect(request.getContextPath() + "/home");
				break;
			default:
				chain.doFilter(servletRequest, servletResponse);
				break;
			}
		} else if (url.startsWith("/admin")) {
			if (request.getSession().getAttribute("accept_1") != null) {
				chain.doFilter(servletRequest, servletResponse);
			} else {
				request.getSession().removeAttribute("fullName_1");
				request.getSession().removeAttribute("id_1");
				response.sendRedirect(request.getContextPath() + "/login?message=not_login_admin");
			}
		}else if (url.startsWith("/manager")){
			if (request.getSession().getAttribute("accept_3") != null) {
				chain.doFilter(servletRequest, servletResponse);
			} else {
				request.getSession().removeAttribute("fullName_3");
				request.getSession().removeAttribute("id_3");
				response.sendRedirect(request.getContextPath() + "/login?message=not_login_manager");
			}
		}		
		else if (url.startsWith("/home") || url.startsWith("/accounts") || url.startsWith("/functions")
				|| url.startsWith("/notifications") || url.startsWith("/projects")) {
			if (request.getSession().getAttribute("accept_5") != null) {
				chain.doFilter(servletRequest, servletResponse);
			} else {
				request.getSession().removeAttribute("fullName_5");
				request.getSession().removeAttribute("id_5");
				response.sendRedirect(request.getContextPath() + "/login?message=not_login_staff");
			}
		} else {
			chain.doFilter(servletRequest, servletResponse);
		}
	}

	@Override
	public void destroy() {
		
	}

}
