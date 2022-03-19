package KhachHangController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class dangkytaikhoan
 */
@WebServlet("/dangkytaikhoan")
public class dangkytaikhoan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangkytaikhoan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		try {
			String ttkh = null;
			String[] dstt = null;
			String tendn = "", pass1 = "", pass2 = "", hoten = "", email = "", sdt = "", diachi = "";
			if(session.getAttribute("ttkh") != null){
				ttkh = (String)session.getAttribute("ttkh");
				dstt = ttkh.split("[;]");
				tendn = dstt[0];
				pass1 = dstt[1];
				pass2 = dstt[2];
				hoten = dstt[3];
				email = dstt[4];
				sdt = dstt[5];
				diachi = dstt[6];
				session.removeAttribute("ttkh");
			}
			request.setAttribute("tendn", tendn);
			request.setAttribute("pass1", pass1);
			request.setAttribute("pass2", pass2);
			request.setAttribute("hoten", hoten);
			request.setAttribute("email", email);
			request.setAttribute("sdt", sdt);
			request.setAttribute("diachi", diachi);
			request.getRequestDispatcher("dangky.jsp").forward(request, response);
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
