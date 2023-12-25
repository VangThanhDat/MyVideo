package com.poly.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.dao.VideoDAO;
import com.poly.bean.User;
import com.poly.bean.Video;

@WebServlet({"/detail", "/detail/*"})
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session =request.getSession();
		if(session.getAttribute("user") != null) {
			User user = (User) session.getAttribute("user");
			request.setAttribute("fullname", user.getFullname());
		}else {
			request.setAttribute("fullname", "Tài khoản");
		}
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String idVideo = request.getParameter("v");
		VideoDAO vdao = new VideoDAO();
		Video video = vdao.findById(idVideo);
		
		List<Video> videos = vdao.find3VideoRandom();
		Integer views = video.getViews() + 1;
		video.setViews(views);
		vdao.update(video);
		
		request.setAttribute("video", video);
		request.setAttribute("videos", videos);
		request.setAttribute("view", "/views/user/detail.jsp");
		request.setAttribute("mainView", "/views/user/layout-user.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}


}
