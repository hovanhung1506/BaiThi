package AdminController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DangNhapbean;
import bean.hoadonbean;
import bean.lichsumuahangbean;
import bo.lichsumuahangBO;

/**
 * Servlet implementation class chitietkhachhang
 */
@WebServlet("/chitietkhachhang")
public class chitietkhachhang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public chitietkhachhang() {
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
			DangNhapbean acc = (DangNhapbean)session.getAttribute("accAdmin");
			String makh = request.getParameter("makh");
			if(acc == null) {
				response.sendRedirect("LoginAdmin");
				return;
			}
			ArrayList<lichsumuahangbean> listLSMH = null;
			ArrayList<hoadonbean> listHD = null;
			lichsumuahangBO lsBO = new lichsumuahangBO();
			listHD = lsBO.dsHDBO(makh);
			listLSMH = lsBO.dsLSMHBO(makh);
			request.setAttribute("listHD", listHD);
			request.setAttribute("listLSMH", listLSMH);
			request.getRequestDispatcher("xemlichsumuakhachhang.jsp").forward(request, response);
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
