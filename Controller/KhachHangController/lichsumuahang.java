package KhachHangController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.KhachHangbean;
import bean.hoadonbean;
import bean.lichsumuahangbean;
import bo.GioHangBO;
import bo.lichsumuahangBO;

/**
 * Servlet implementation class lichsumuahang
 */
@WebServlet("/lichsumuahang")
public class lichsumuahang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lichsumuahang() {
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
			int soluong = 0;
			GioHangBO gh = null;
			KhachHangbean acc = (KhachHangbean)session.getAttribute("acc");
			lichsumuahangBO lsBO = new lichsumuahangBO();
			if(session.getAttribute("gh") != null) {
				gh = (GioHangBO)session.getAttribute("gh");
				soluong = gh.ds.size();
			}
			
			ArrayList<lichsumuahangbean> listLSMH = null;
			ArrayList<hoadonbean> listHD = null;
			
			if(acc != null) {
				listHD = lsBO.dsHDBO(acc.getMaKhachHang());
				listLSMH = lsBO.dsLSMHBO(acc.getMaKhachHang());
			}
			
			request.setAttribute("soluong", soluong);
			request.setAttribute("listHD", listHD);
			request.setAttribute("listLSMH", listLSMH);
			request.getRequestDispatcher("lichsumuahang.jsp").forward(request, response);
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
