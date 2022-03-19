package AdminController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DangNhapbean;
import bo.DangNhapBO;

/**
 * Servlet implementation class ktdnAdmin
 */
@WebServlet("/KiemTraAdmin")
public class ktdnAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ktdnAdmin() {
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
			String tendn = request.getParameter("username");
			String matkhau = request.getParameter("pass");
			String logout = request.getParameter("logout");
			DangNhapBO bo = new DangNhapBO();
			DangNhapbean acc = bo.getTaiKhoanAdminBO(tendn, matkhau);
			if(logout != null && logout.equals("1")) {
				session.removeAttribute("accAdmin");
				response.sendRedirect("LoginAdmin");
				return;
			}
			if(acc != null) {
				session.setAttribute("accAdmin", acc);
				response.sendRedirect("HomeAdmin");
				return;
			}else {
				session.setAttribute("ktdnadmin", "0");
				response.sendRedirect("LoginAdmin");
			}
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
