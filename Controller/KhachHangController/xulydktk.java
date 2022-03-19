package KhachHangController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.KhachHangBO;

/**
 * Servlet implementation class xulydktk
 */
@WebServlet("/xulydktk")
public class xulydktk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xulydktk() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			String tendn = request.getParameter("txtun");
			String pass1 = request.getParameter("txtpass1");
			String pass2 = request.getParameter("txtpass2");
			String hoten = request.getParameter("txtten");
			String email = request.getParameter("txtemail");
			String sdt = request.getParameter("txtsdt");
			String diachi = request.getParameter("txtdc");
			String thongTinKhachHang = tendn + ";" + pass1 + ";" + pass2 + ";" + hoten + ";" + email + ";" + sdt + ";" + diachi;
			HttpSession session = request.getSession();
			
			session.setAttribute("ttkh", thongTinKhachHang);
			KhachHangBO khbo = new KhachHangBO();
			boolean kttmk = khbo.kiemTraTrungMatKhauBO(pass1, pass2);
			if(kttmk) {
				session.setAttribute("kttmk", kttmk);
				response.sendRedirect("dangkytaikhoan");
				return;
			}
			int maloi = khbo.kiemTraThongTinBO(sdt, email, tendn);
			if(maloi != 0) {
				session.setAttribute("maloi", maloi);
			}else {
				
				khbo.themKhachHangBO(hoten, sdt, diachi, email, tendn, pass1);
				session.setAttribute("taotk", (boolean)true);
			}
			response.sendRedirect("dangkytaikhoan");
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
