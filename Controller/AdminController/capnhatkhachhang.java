package AdminController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.KhachHangBO;

/**
 * Servlet implementation class capnhatkhachhang
 */
@WebServlet("/capnhatkhachhang")
public class capnhatkhachhang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public capnhatkhachhang() {
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
			String makh = request.getParameter("txtmakh");
			String tenkh = request.getParameter("txtTenKH");
			String diachi = request.getParameter("txtDC");
			String sodt = request.getParameter("txtSdt");
			String email = request.getParameter("txtEmail");
			String matkhau = request.getParameter("txtPass");
			KhachHangBO bo = new KhachHangBO();
			bo.SuaKhachHangBO(makh, tenkh, sodt, diachi, email, matkhau);
			session.setAttribute("suaKH", "1");
			response.sendRedirect("quanlykhadmin");
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
