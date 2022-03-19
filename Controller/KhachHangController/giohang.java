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
import bean.NhaSanXuatbean;
import bo.GioHangBO;
import bo.NhaSanXuatBO;

/**
 * Servlet implementation class giohang
 */
@WebServlet("/giohang")
public class giohang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public giohang() {
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
			NhaSanXuatBO nsxbo = new NhaSanXuatBO();
			ArrayList<NhaSanXuatbean> listNSX = nsxbo.getAllNSX();
			ArrayList<GioHangbean> listGioHang = null;
			int tongtien = 0, soluong = 0;
			if(session.getAttribute("gh") != null) {
				GioHangBO ghbo = (GioHangBO)session.getAttribute("gh");
				listGioHang = ghbo.ds;
				tongtien = ghbo.TongTien();
				soluong = ghbo.ds.size();
			}
			request.setAttribute("soluong", soluong);
			request.setAttribute("listGioHang", listGioHang);
			request.setAttribute("listNSX", listNSX);
			request.setAttribute("tongtien", tongtien);
			request.getRequestDispatcher("giohang.jsp").forward(request, response);
			
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
