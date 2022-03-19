package KhachHangController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.GioHangBO;

/**
 * Servlet implementation class themgiohang
 */
@WebServlet("/themgiohang")
public class themgiohang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public themgiohang() {
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
			PrintWriter out = response.getWriter();
			String madt = request.getParameter("madt");
			String tendt = request.getParameter("tendt");
			int gia = Integer.parseInt(request.getParameter("gia"));
			String anh = request.getParameter("anh");
			HttpSession session = request.getSession();
			GioHangBO ghbo = null;
			if(session.getAttribute("gh") == null){
				ghbo = new GioHangBO();
				session.setAttribute("gh", ghbo);
			}
			int slhang = 0;
			if(session.getAttribute("gh") != null) {
				ghbo = (GioHangBO)session.getAttribute("gh");
				ghbo.Them(madt, tendt, gia, 1, anh);
				session.setAttribute("gh", ghbo);
				slhang = ghbo.ds.size();
			}
			out.print(slhang);
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
