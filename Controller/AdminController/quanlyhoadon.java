package AdminController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DienThoaibean;
import bean.hoadonbean;
import bean.lichsumuahangbean;
import bo.DienThoaiBO;
import bo.quanlyhoadonBO;

/**
 * Servlet implementation class quanlyhoadon
 */
@WebServlet("/quanlyhoadon")
public class quanlyhoadon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public quanlyhoadon() {
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
			if(session.getAttribute("accAdmin") == null) {
				response.sendRedirect("LoginAdmin");
				return;
			}
			quanlyhoadonBO bo = new quanlyhoadonBO();
			ArrayList<hoadonbean> listHD = bo.getListHDBO();
			ArrayList<lichsumuahangbean> listLSHD = bo.getListLSMHBO();
			DienThoaiBO dtbo = new DienThoaiBO();
			ArrayList<DienThoaibean> listDT = dtbo.getAllDienThoaiBO();
			
			ArrayList<hoadonbean> listHDChuaXN = bo.getHDChuaXNBO();
			ArrayList<lichsumuahangbean> listLSHDChuaXN = bo.getLSHDChuaXNBO();
			request.setAttribute("listDT", listDT);
			request.setAttribute("listHD", listHD);
			request.setAttribute("listLSHD", listLSHD);
			request.setAttribute("listHDChuaXN", listHDChuaXN);
			request.setAttribute("listLSHDChuaXN", listLSHDChuaXN);
			request.getRequestDispatcher("quanlyhoadon.jsp").forward(request, response);
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
