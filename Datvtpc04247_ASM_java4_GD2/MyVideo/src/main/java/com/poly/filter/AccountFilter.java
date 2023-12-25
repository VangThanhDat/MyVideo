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

/**
 * Servlet Filter implementation class AuthFilter
 */
@WebFilter({"/account/edit-profile/*", "/favorite/*"})
public class AccountFilter extends HttpFilter implements Filter {
       
    private static final long serialVersionUID = 1L;


	/**
     * @see HttpFilter#HttpFilter()
     */
    public AccountFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}
	
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		User user = (User) request.getSession().getAttribute("user");
		if(user == null) {
			request.setAttribute("mainView", "/views/account/sign-in.jsp");
			request.getRequestDispatcher("/views/layout.jsp").forward(request, resp);
		}
		else {// truy câp hop lê
			chain.doFilter(request, resp);
		}
	}


	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
