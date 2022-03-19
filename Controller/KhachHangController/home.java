package KhachHangController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DienThoaibean;
import bean.NhaSanXuatbean;
import bo.DienThoaiBO;
import bo.GioHangBO;
import bo.NhaSanXuatBO;

/**
 * Servlet implementation class home
 */
@WebServlet("/home")
public class home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public home() {
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
			GioHangBO ghbo = null;
			if(session.getAttribute("gh") != null) {
				ghbo = (GioHangBO)session.getAttribute("gh");
				soluong = ghbo.ds.size();
			}
			String mansx = request.getParameter("product");
			String search = request.getParameter("search");
			DienThoaiBO dtbo = new DienThoaiBO();
			NhaSanXuatBO nsxbo = new NhaSanXuatBO();
			ArrayList<DienThoaibean> listDienThoai = new ArrayList<DienThoaibean>();
			ArrayList<NhaSanXuatbean> listNSX = new ArrayList<NhaSanXuatbean>();
			if(mansx != null) {
				listDienThoai = dtbo.getByNSXBO(mansx);
				listNSX = nsxbo.getAllNSX();
				request.setAttribute("loaidt", "1");
			}else if(search != null) {
				listDienThoai = dtbo.SearchBO(search);
				listNSX = nsxbo.getAllNSX();
				request.setAttribute("search", search);
			}else {
				listDienThoai = dtbo.get10DienThoaiBO();
				listNSX = nsxbo.getAllNSX();
			}
			request.setAttribute("listDienThoai", listDienThoai);
			request.setAttribute("listNSX", listNSX);
			request.setAttribute("soluong", soluong);
			request.setAttribute("timkiemajax", "1");
			request.getRequestDispatcher("home.jsp").forward(request, response);
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
