package AdminController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.NhaSanXuatBO;

/**
 * Servlet implementation class themloaiadmin
 */
@WebServlet("/themloaiadmin")
public class themloaiadmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public themloaiadmin() {
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
			String mansx = request.getParameter("maloai");
			String tennsx = request.getParameter("tenloai");
			NhaSanXuatBO bo = new NhaSanXuatBO();
			if(bo.KiemTraMaNSXBO(mansx)) {
				session.setAttribute("msg", '1');
				response.sendRedirect("quanlyloaiAdmin");
				return;
			}
			bo.ThemNSXBO(mansx, tennsx);
			session.setAttribute("themloai", "1");
			response.sendRedirect("quanlyloaiAdmin");
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
