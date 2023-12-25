package com.poly.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.poly.dao.FavoriteDAO;
import com.poly.dao.ShareDAO;
import com.poly.dao.VideoDAO;
import com.poly.bean.Favorite;
import com.poly.bean.Share;
import com.poly.bean.Video;

@WebServlet({ "/admin/video/index", "/admin/video/edit/*", "/admin/video/create", "/admin/video/update",
		"/admin/video/delete" })
public class VideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public VideoServlet() {
		super();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		boolean status = false;
		VideoDAO dao = new VideoDAO();
		Video video = new Video();
		String uri = request.getRequestURI();
		if (uri.contains("edit")) {
			String id = uri.substring(uri.lastIndexOf("/") + 1);
			video = dao.findById(id);
			status = true;
			request.setAttribute("status", status);
		} else if (uri.contains("create")) {
			Boolean checkId = true;
			String newVideoID = request.getParameter("id");
			System.out.println("==================================");
			System.out.println("newVideoID: " + newVideoID);
			List<Video> list = dao.findAll();
			for (Video u : list) {
				System.out.println(u.getId());
				if (u.getId().equals(newVideoID)) {
					checkId = false;
					break;
				}
			}
			if (checkId == true) {
				try {
					BeanUtils.populate(video, request.getParameterMap());
					dao.insert(video);
					request.setAttribute("message", "Thêm mới thành công");
				} catch (Exception e) {
					request.setAttribute("message", "Thêm mới thất bại");
					e.printStackTrace();
				}
			} else {
				request.setAttribute("message", "Thêm mới thất bại, tên đăng nhập đã tồn tại");
			}

		} else if (uri.contains("update")) {
			try {
				BeanUtils.populate(video, request.getParameterMap());
				dao.update(video);
				video = null;
				request.setAttribute("message", "Cập nhật thành công");
			} catch (Exception e) {
				request.setAttribute("message", "Cập nhật thất bại");
				e.printStackTrace();
			}

		} else if (uri.contains("delete")) {
			try {
				;
				String id = request.getParameter("id");
				FavoriteDAO fdao = new FavoriteDAO();
				List<Favorite> listf = fdao.findFavoriteByVideoID(id);
				for (Favorite favorite : listf) {
					System.out.println("Favorite ID: ");
					System.out.println(favorite.getId());
					fdao.delete(favorite);

				}
				System.out.println("Favorite done");
				ShareDAO sdao = new ShareDAO();
				List<Share> lists = sdao.findShareByVideoID(id);
				for (Share share : lists) {
					System.out.println("Share ID: ");
					System.out.println(share.getId());
					sdao.delete(share);
				}
				System.out.println("Share done");

				Video videoDelete = dao.findById(id);
				dao.delete(videoDelete);
				request.setAttribute("message", "Xóa thành công");
			} catch (Exception e) {
				request.setAttribute("message", "Xóa thất bại");
				e.printStackTrace();
			}
		}
		request.setAttribute("form", video);
		request.setAttribute("items", dao.findAll());
		request.setAttribute("mainView", "/views/admin/layout-admin.jsp");
		request.setAttribute("view", "/views/admin/video.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
