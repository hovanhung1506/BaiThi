package KhachHangController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DienThoaibean;
import bean.ThongSoKyThuatbean;
import bo.DienThoaiBO;
import bo.GioHangBO;
import bo.ThongSoKyThuatBO;

/**
 * Servlet implementation class product
 */
@WebServlet("/product")
public class product extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public product() {
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
			String madienthoai = request.getParameter("id");
			DienThoaiBO dtbo = new DienThoaiBO();
			ThongSoKyThuatBO tsktbo = new ThongSoKyThuatBO();
			DienThoaibean dienthoai = dtbo.getByMaDienThoaiBO(madienthoai);
			ThongSoKyThuatbean thongso = tsktbo.getByMaDienThoaiDAO(madienthoai);
			HttpSession session = request.getSession();
			GioHangBO ghbo = null;
			int soluong = 0;
			if(session.getAttribute("gh") != null) {
				ghbo = (GioHangBO)session.getAttribute("gh");
				soluong = ghbo.ds.size();
			}
			request.setAttribute("soluong", soluong);
			request.setAttribute("dienthoai", dienthoai);
			request.setAttribute("thongso", thongso);
			request.getRequestDispatcher("product.jsp").forward(request, response);
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
