package KhachHangController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.GioHangbean;
import bean.KhachHangbean;
import bo.GioHangBO;

/**
 * Servlet implementation class xndm
 */
@WebServlet("/xndm")
public class xndm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xndm() {
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
			GioHangBO gh = (GioHangBO)session.getAttribute("gh");
			GioHangBO ghbo = new GioHangBO();
			ArrayList<GioHangbean> giohang = gh.ds;
			KhachHangbean acc = (KhachHangbean)session.getAttribute("acc");
			
			ghbo.ThemHDBO(acc.getMaKhachHang());
			int mahd = ghbo.MaHDVuaTao();
			ghbo.ThemCTHDBO(giohang, mahd);
			
			session.setAttribute("datmua", "1");
			response.sendRedirect("xulygiohang");
			
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
