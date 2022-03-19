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
import bean.NhaSanXuatbean;
import bo.NhaSanXuatBO;

/**
 * Servlet implementation class quanlyloaiAdmin
 */
@WebServlet("/quanlyloaiAdmin")
public class quanlyloaiAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public quanlyloaiAdmin() {
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
			NhaSanXuatBO bo = new NhaSanXuatBO();
			HttpSession session = request.getSession();
			DangNhapbean acc = (DangNhapbean)session.getAttribute("accAdmin");
			if(acc == null) {
				response.sendRedirect("LoginAdmin");
				return;
			}
			ArrayList<NhaSanXuatbean> listLoai = bo.getAllNSX();
			request.setAttribute("listLoai", listLoai);
			request.getRequestDispatcher("quanlyloai.jsp").forward(request, response);
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
