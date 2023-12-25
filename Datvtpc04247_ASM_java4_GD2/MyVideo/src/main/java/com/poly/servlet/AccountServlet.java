package com.poly.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.poly.bean.User;
import com.poly.dao.UserDAO;
import com.poly.until.CookieUtils;

@WebServlet({ "/account/login", "/account/register", "/account/sign-out", "/account/forgotpass",
		"/account/edit-profile", "/account/get-otp", "/account/forgotpass/get-otp",
		"/account/forgotpass/verify", "/account/forgotpass/change" })
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AccountServlet() {
		super();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		if (uri.contains("login")) {
			this.dologin(request, response);
		} else if (uri.contains("register")) {
			this.doRegister(request, response);
		} else if (uri.contains("sign-out")) {
			this.doSignOut(request, response);
		} else if (uri.contains("forgotpass")) {
			this.doForgotPassword(request, response);

		} else if (uri.contains("edit-profile")) {
			this.doEditProfile(request, response);
		} else {
			request.setAttribute("mainView", "/views/account/login.jsp");
			request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
		}

	}

	private void dologin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setAttribute("mainView", "/views/account/login.jsp");

		String username = CookieUtils.get("username", request);
		request.setAttribute("username", username);

		String pwd = CookieUtils.get("password", request);
		request.setAttribute("password", pwd);

		String menthod = request.getMethod();
		if (menthod.equalsIgnoreCase("POST")) {
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String remember = request.getParameter("remember");
			try {
				UserDAO dao = new UserDAO();
				User user = dao.findById(id);
				System.out.println("=======================================");
				System.out.println("Username: " + user.getId());
				System.out.println("Password: " + user.getPassword());
				if (user.getPassword().equals(password)) {
					request.setAttribute("message", "Đăng nhập thành công!");
					request.getSession().setAttribute("user", user);
					System.out.println("Set user vào session thành công");
					int hours = (remember == null) ? 0 : 30 * 24;
					CookieUtils.add("username", id, hours, response);
					CookieUtils.add("password", password, hours, response);
					response.sendRedirect(request.getContextPath() + "/home");
				} else {
					request.setAttribute("message", "Sai mật khẩu đăng nhập!");
					request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("message", "Tên đăng nhập không tồn tại!");
				request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
			}
		} else {
			request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
		}
	}

	private void doRegister(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String menthod = request.getMethod();
		UserDAO dao = new UserDAO();

		if (menthod.equalsIgnoreCase("POST")) {
			Boolean checkId = true;
			String newUserID = request.getParameter("id");
			System.out.println("newUserID: " + newUserID);
			List<User> list = dao.findAll();
			for (User u : list) {
				System.out.println(u.getId());
				if (u.getId().equals(newUserID)) {
					checkId = false;
					break;
				}
			}
			if (checkId == true) {
				try {
					User user = new User();
					BeanUtils.populate(user, request.getParameterMap());
					dao.insert(user);

					request.setAttribute("message", "Đăng ký thành công");
					this.doSendMailWelcome(request, response);
					request.setAttribute("mainView", "/views/account/register.jsp");
					request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
					request.setAttribute("message", "Lỗi đăng ký");
					request.setAttribute("mainView", "/views/account/register.jsp");
					request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("message", "Lỗi đăng ký, tên đăng nhập đã tồn tại");
				request.setAttribute("mainView", "/views/account/register.jsp");
				request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
			}

		} else {
			request.setAttribute("mainView", "/views/account/register.jsp");
			request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
		}

	}

	private void doSignOut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.getSession().removeAttribute("user");
		response.sendRedirect(request.getContextPath() + "/home");

	}

	private void doSendMailWelcome(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true"); // TLS
		prop.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");

		String username = "myvideo.forfun.contact@gmail.com"; // Thay đổi email người gửi
		String password = "rbwmnvriedxpjisl"; // Thay đổi pass người gửi

		Session session = Session.getInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}

		});

		String fullname = request.getParameter("fullname");
		String receiver = request.getParameter("email");
		String subject = "Chào mừng bạn đến với MyVideo - Đăng ký thành công tài khoản!";
		String body = "Chào " + fullname + "," + "\n\n"
				+ "Chúc mừng bạn đã đăng ký thành công tài khoản tại trang web của chúng tôi! Chúng tôi rất vui mừng và cảm ơn bạn đã lựa chọn sử dụng dịch vụ của chúng tôi."
				+ "\n\n"
				+ "Bằng cách đăng ký tài khoản, bạn sẽ có được nhiều lợi ích và tiện ích từ trang web của chúng tôi. Bạn có thể truy cập các tính năng đặc biệt, nhận thông tin mới nhất về sản phẩm của chúng tôi và tham gia cộng đồng của chúng tôi."
				+ "\n\n"
				+ "Nếu bạn có bất kỳ câu hỏi hoặc thắc mắc nào về tài khoản của mình, hãy liên hệ với chúng tôi qua địa chỉ email hoặc số điện thoại được cung cấp trong trang liên hệ. Chúng tôi sẽ luôn sẵn sàng hỗ trợ bạn."
				+ "\n\n" + "Một lần nữa, cảm ơn bạn đã đăng ký và chúc bạn một ngày tuyệt vời!" + "\n\n" + "Trân trọng,"
				+ "\n" + "MyVideo";
		System.out.println("body " + body);

		try {
			Message message = new MimeMessage(session);
			Multipart multipart = new MimeMultipart();
			MimeBodyPart messageBodyPart1 = new MimeBodyPart();
			messageBodyPart1.setText(body.toString());
			multipart.addBodyPart(messageBodyPart1);

			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiver));
			message.setSubject(subject);

			message.setContent(multipart);
			Transport.send(message);
			System.out.println("Email content: " + message.getContent());
			System.out.println("Done");
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void doEditProfile(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setAttribute("mainView", "/views/account/profile.jsp");
		User user = (User) request.getSession().getAttribute("user");
		String menthod = request.getMethod();
		UserDAO dao = new UserDAO();
		if (menthod.equalsIgnoreCase("POST")) {
			try {
				BeanUtils.populate(user, request.getParameterMap());
				dao.update(user);
				request.setAttribute("message", "Cập nhật thành công");
				request.setAttribute("mainView", "/views/account/profile.jsp");
				request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("message", "Lỗi cập nhật tài khoản");
				request.setAttribute("mainView", "/views/account/profile.jsp");
				request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("user", user);
		
			request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
		}
	}

	private void doForgotPassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		String menthod = request.getMethod();
		UserDAO dao = new UserDAO();

		if (menthod.equalsIgnoreCase("POST")) {

			if (uri.contains("get-otp")) {
				Boolean checkId = true;
				String forgotUserID = request.getParameter("id");
				System.out.println("forgotUserID: " + forgotUserID);
				List<User> list = dao.findAll();
				for (User u : list) {
					System.out.println(u.getId());
					if (u.getId().equals(forgotUserID)) {
						checkId = false;
						User user = dao.findById(forgotUserID);
						request.getSession().setAttribute("userChange", user);
						;
						break;
					}
				}
				if (checkId == false) {
					this.doSendOTP(request, response);
					// Lưu thời gian gửi yêu cầu
					Date requestTime = new Date();
					request.getSession().setAttribute("requestTime", requestTime);
					request.setAttribute("page", "verify");
					request.setAttribute("mainView", "/views/account/forgotpass.jsp");
					request.getRequestDispatcher("/views/layout.jsp").forward(request, response);

				} else {
					request.setAttribute("message", "Lỗi, không tìm thấy tài khoản");
					request.setAttribute("mainView", "/views/account/forgotpass.jsp");
					request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
				}
			} else if (uri.contains("verify")) {
				String userInputCode = request.getParameter("otp");
				HttpSession session = request.getSession();
				String confirmationCode = session.getAttribute("code").toString();
				Date requestTime = (Date) session.getAttribute("requestTime");

				Date currentTime = new Date();
				long timeElapsed = currentTime.getTime() - requestTime.getTime();
				System.out.println("current: " + currentTime.getTime());
				System.out.println("request: " + requestTime.getTime());
				if (timeElapsed <= 60000) { 
					if (confirmationCode.equals(userInputCode)) {
						request.setAttribute("message", "Mã xác nhận chính xác");
						request.setAttribute("page", "change");
						request.setAttribute("mainView", "/views/account/forgotpass.jsp");
						request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
					} else {
						request.setAttribute("message", "Mã xác nhận chưa chính xác");
						request.setAttribute("page", "verify");
						request.setAttribute("mainView", "/views/account/forgotpass.jsp");
						request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
					}
				} else {
					request.setAttribute("message", "Mã xác nhận đã hết hạn");
					request.getSession().removeAttribute("userChange");
					session.removeAttribute("code");
					session.removeAttribute("requestTime");
					request.setAttribute("page", "verify");
					request.setAttribute("mainView", "/views/account/forgotpass.jsp");
					request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
				}

			} else if (uri.contains("change")) {
				HttpSession session = request.getSession();
				User userChange = (User) session.getAttribute("userChange");
				System.out.println("User password: " + userChange.getPassword());
				String newPW = request.getParameter("newPassword");
				String confirmPW = request.getParameter("confirmPassword");
				if (newPW.equals(confirmPW)) {
					userChange.setPassword(confirmPW);
					dao.update(userChange);
					System.out.println("Update thành công");
					request.setAttribute("message", "Thay đổi mật khẩu thành công");
					request.getSession().removeAttribute("userChange");
					request.getSession().removeAttribute("requestTime");
					request.getSession().removeAttribute("code");
					request.setAttribute("page", "change");
					request.setAttribute("mainView", "/views/account/forgotpass.jsp");
					request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
				} else {
					request.setAttribute("message", "Mật khẩu chưa khớp");
					request.setAttribute("page", "change");
					request.setAttribute("mainView", "/views/account/forgotpass.jsp");
					request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
				}

			}

		} else {
			request.setAttribute("mainView", "/views/account/forgotpass.jsp");
			request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
		}
	}

	private void doSendOTP(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true"); // TLS
		prop.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");

		String username = "myvideo.forfun.contact@gmail.com"; // Thay đổi email người gửi
		String password = "rbwmnvriedxpjisl"; // Thay đổi pass người gửi

		Session session = Session.getInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}

		});
		final String CHARACTERS = "0123456789";
		final int CODE_LENGTH = 6;
		Random random = new Random();
		StringBuilder code = new StringBuilder(CODE_LENGTH);
		for (int i = 0; i < CODE_LENGTH; i++) {
			code.append(CHARACTERS.charAt(random.nextInt(CHARACTERS.length())));
		}
		System.out.println("otp: " + code);
		request.getSession().setAttribute("code", code);

		String forgotUserID = request.getParameter("id");
		UserDAO dao = new UserDAO();
		User user = dao.findById(forgotUserID);

		String fullname = user.getFullname();
		String receiver = user.getEmail();
		String subject = "Xác nhận tài khoản của bạn - Mã xác nhận";
		String body = "Chào " + fullname + "," + "\n\n" + "Mã xác nhận của bạn là: " + code
				+ ". Vui lòng nhập mã này vào trang web của chúng tôi để hoàn tất quá trình xác nhận tài khoản."
				+ "\n\n"
				+ "Lưu ý: Mã xác nhận này sẽ chỉ có hiệu lực trong vòng 60 giây. Nếu bạn không xác nhận tài khoản trong khoảng thời gian này, mã sẽ hết hiệu lực và bạn sẽ cần phải đăng ký lại."
				+ "\n\n"
				+ "Nếu bạn có bất kỳ câu hỏi hoặc thắc mắc nào về tài khoản của mình, hãy liên hệ với chúng tôi qua địa chỉ email hoặc số điện thoại được cung cấp trong trang liên hệ. Chúng tôi sẽ luôn sẵn sàng hỗ trợ bạn."
				+ "\n\n" + "Nếu bạn không thực hiện yêu cầu này, vui lòng bỏ qua email này." + "\n\n" + "Trân trọng,"
				+ "\n" + "MyVideo";
		System.out.println("body " + body);

		try {
			Message message = new MimeMessage(session);
			Multipart multipart = new MimeMultipart();
			MimeBodyPart messageBodyPart1 = new MimeBodyPart();
			messageBodyPart1.setText(body.toString());
			multipart.addBodyPart(messageBodyPart1);

			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiver));
			message.setSubject(subject);

			message.setContent(multipart);
			Transport.send(message);
			System.out.println("Email content: " + message.getContent());
			System.out.println("Done");
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
