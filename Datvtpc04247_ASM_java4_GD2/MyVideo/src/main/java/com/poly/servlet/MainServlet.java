package com.poly.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.bean.User;
import com.poly.bean.Video;
import com.poly.dao.VideoDAO;

@WebServlet({ "/home", "/contact", "/about", "/favorite" })
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MainServlet() {
		super();
	}

	VideoDAO vdao = new VideoDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		request.setAttribute("mainView", "/views/user/layout-user.jsp");
		String uri = request.getRequestURI();
		System.out.println("URI: " + uri);

		if (session.getAttribute("user") != null) {
			User user = (User) session.getAttribute("user");
			request.setAttribute("fullname", user.getFullname());
		} else {
			request.setAttribute("fullname", "Tài khoản");
		}

		if (uri.contains("home")) {
			List<Video> lv = vdao.findAll();
			request.setAttribute("videos", lv);
			request.setAttribute("currentPage", "home");
			request.setAttribute("view", "/views/user/index.jsp");
		} else if (uri.contains("contact")) {
			request.setAttribute("currentPage", "contact");
			request.setAttribute("view", "/views/user/contact.jsp");
		} else if (uri.contains("about")) {
			request.setAttribute("currentPage", "about");
			request.setAttribute("view", "/views/user/about.jsp");
		} else if (uri.contains("favorite")) {
			User user = (User) session.getAttribute("user");
			List<Video> lv = vdao.findVideoFavoriteByUser(user.getId());
			request.setAttribute("currentPage", "/favorite");
			request.setAttribute("view", "/views/user/favorite.jsp");
			request.setAttribute("videos", lv);
		}

		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

}
