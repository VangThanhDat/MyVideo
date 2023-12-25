package com.poly.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.bean.User;

@WebFilter({"/admin/*"})
public class AuthFilter extends HttpFilter implements Filter {
       
    private static final long serialVersionUID = 1L;

    public AuthFilter() {
        super();
    }

	public void destroy() {
	}
	
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		String uri = request.getRequestURI();
		User user = (User) request.getSession().getAttribute("user");
		String error = "";
		if(user == null) {
			request.setAttribute("mainView", "/views/account/login.jsp");
			request.getRequestDispatcher("/views/layout.jsp").forward(request, resp);
		} else if(!user.getAdmin() && uri.contains("/admin/")) {
			request.setAttribute("mainView", "/views/account/login.jsp");
			request.getRequestDispatcher("/views/layout.jsp").forward(request, resp);
		}
		if(!user.getAdmin()) {
			request.getSession().setAttribute("security", uri);
			request.setAttribute("mainView", "/views/account/login.jsp");
			request.getRequestDispatcher("/views/layout.jsp").forward(request, resp);
		} 
		else {
			chain.doFilter(request, resp);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
