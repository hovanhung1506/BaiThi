package AdminController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import bo.DangNhapBO;

/**
 * Servlet implementation class dangkychoadmin
 */
@WebServlet("/dangkychoadmin")
public class dangkychoadmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangkychoadmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			String username = request.getParameter("username");
			String pass = request.getParameter("pass");
			String tennguoi = request.getParameter("tennguoi");
			int quyen = Integer.parseInt(request.getParameter("quyen"));
			DangNhapBO bo = new DangNhapBO();
			
			int kt = bo.KiemTraTrungTenDNBO(username);
			if(kt == 1) {
				session.setAttribute("msg", "0");
				response.sendRedirect("dangkyadmin");
				return;
			}
			bo.TaoTaiKhoanAdminBO(username, pass, tennguoi, quyen);
			session.setAttribute("msg", "1");
			response.sendRedirect("dangkyadmin");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
