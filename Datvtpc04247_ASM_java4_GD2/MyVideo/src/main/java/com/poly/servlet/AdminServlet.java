package com.poly.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.dao.UserDAO;
import com.poly.dao.VideoDAO;

@WebServlet({"/admin/", "/admin/home", "/admin/user", "/admin/video" , "/admin/report"})
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
    	request.setAttribute("mainView", "/views/admin/layout-admin.jsp");
    	String uri =  request.getRequestURI(); 	
    	String lastUri = uri.substring(uri.lastIndexOf("/") + 1);
    	request.setAttribute("currentPageAdmin", "/home");
    	System.out.println("URI: "+uri);
		if (lastUri.contains("home")) {
			System.out.println("Home success");
			request.setAttribute("currentPageAdmin", "/home");
			request.setAttribute("view", "/views/admin/index.jsp");
		}else if (lastUri.contains("user")) {
			UserDAO udao = new UserDAO();
	    	request.setAttribute("items", udao.findAll());
			request.setAttribute("currentPageAdmin", "/user");
			request.setAttribute("view", "/views/admin/user.jsp");
		}else if (lastUri.contains("video")) {
			VideoDAO vdao = new VideoDAO();
	    	request.setAttribute("items", vdao.findAll());
			request.setAttribute("currentPageAdmin", "/video");
			request.setAttribute("view", "/views/admin/video.jsp");
		}else if (lastUri.contains("report")) {
			request.setAttribute("currentPageAdmin", "/report");
			request.setAttribute("view", "/views/admin/report.jsp");
		}
		
    	request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}


}
