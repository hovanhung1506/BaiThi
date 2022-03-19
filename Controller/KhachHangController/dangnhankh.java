package KhachHangController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.KhachHangbean;
import bo.KhachHangBO;

/**
 * Servlet implementation class dangnhankh
 */
@WebServlet("/dangnhankh")
public class dangnhankh extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangnhankh() {
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
			String tendn = request.getParameter("txtun");
			String matkhau = request.getParameter("txtpass");
			String logout = request.getParameter("logout");
			KhachHangBO khbo = new KhachHangBO();
			KhachHangbean acc = khbo.getAccBO(tendn, matkhau);
			
			if(logout != null && logout.equals("1")) {
				session.invalidate();
				response.sendRedirect("home");
				return;
			}
			if(acc == null) {
				session.setAttribute("acc", acc);
				session.setAttribute("kt", "0");
				response.sendRedirect("home");
			}else {
				session.setAttribute("acc", acc);
				response.sendRedirect("home");
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
