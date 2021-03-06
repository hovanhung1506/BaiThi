package AdminController;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.DienThoaiBO;
import bo.admin_dienthoaiBO;

/**
 * Servlet implementation class xoadienthoai
 */
@WebServlet("/xoadienthoai")
public class xoadienthoai extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xoadienthoai() {
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
			String madt = request.getParameter("madt");
			admin_dienthoaiBO bo = new admin_dienthoaiBO();
			String anhcu = bo.XoaAnhBO(madt);
			bo.XoaDienThoai(madt);
			String dirURL1 = request.getServletContext().getRealPath("");
			File f = new File(dirURL1 + "\\" + anhcu);
			f.delete();
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
