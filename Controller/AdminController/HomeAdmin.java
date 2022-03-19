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
import bean.DienThoaibean;
import bean.NhaSanXuatbean;
import bean.ThongSoKyThuatbean;
import bo.DienThoaiBO;
import bo.NhaSanXuatBO;
import bo.ThongSoKyThuatBO;

/**
 * Servlet implementation class HomeAdmin
 */
@WebServlet("/HomeAdmin")
public class HomeAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			DienThoaiBO dtbo = new DienThoaiBO();
			NhaSanXuatBO nsxbo = new NhaSanXuatBO();
			ThongSoKyThuatBO tsktbo = new ThongSoKyThuatBO();
			HttpSession session = request.getSession();
			DangNhapbean acc = (DangNhapbean)session.getAttribute("accAdmin");
			String hang = request.getParameter("hang");
			String search = request.getParameter("search");
			ArrayList<DienThoaibean> listDT = null;
			ArrayList<NhaSanXuatbean> listNSX = null;
			if(acc == null) {
				response.sendRedirect("LoginAdmin");
				return;
			}
			if(hang != null) {
				listDT = dtbo.getByNSXBO(hang);
				request.setAttribute("tag", hang);
			}else if(search != null) {
				listDT = dtbo.SearchBO(search);
			}else {
				listDT = dtbo.getAllDienThoaiBO();
			}
			
			listNSX = nsxbo.getAllNSX();
			ArrayList<ThongSoKyThuatbean> listTS = tsktbo.getAllTSKTBO();
			request.setAttribute("listNSX", listNSX);
			request.setAttribute("listDT", listDT);
			request.setAttribute("listTS", listTS);
			request.getRequestDispatcher("HomeAdmin.jsp").forward(request, response);
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
