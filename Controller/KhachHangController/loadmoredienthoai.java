package KhachHangController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DienThoaibean;
import bo.DienThoaiBO;

/**
 * Servlet implementation class loadmoredienthoai
 */
@WebServlet("/loadmoredienthoai")
public class loadmoredienthoai extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loadmoredienthoai() {
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
			DienThoaiBO bo = new DienThoaiBO();
			int sl = Integer.parseInt(request.getParameter("amount"));
			ArrayList<DienThoaibean> ds = bo.getNext5DAO(sl);
			PrintWriter out = response.getWriter();
			for(DienThoaibean o : ds) {
				out.println("<div class=\"col item\">\r\n"
						+ "                    <div class=\"thumbnail product-item\">\r\n"
						+ "                        <a href=\"product?id="+o.getMaDienThoai()+"\">\r\n"
						+ "                            <img src=\""+o.getAnh()+"\" style=\"height: 160px\" alt=\"\">\r\n"
						+ "                            <div class=\"caption\">\r\n"
						+ "                                <p class=\"title-item\">"+o.getTenDienThoai()+"</p>\r\n"
						+ "                                <p class=\"author-item\">Hãng: "+o.getMaNSX()+"</p>\r\n"
						+ "                                <p class=\"price-item\">Giá: "+o.getGia()+" ₫</p>\r\n"
						+ "                            </div>\r\n"
						+ "                        </a>\r\n"
						+ "                        <button class=\"btn btn-primary\" role=\"button\" onclick=\"ThemHang('"+o.getMaDienThoai()+"', '"+o.getTenDienThoai()+"', '"+o.getGia()+"', '"+o.getAnh()+"')\">Thêm vào giỏ hàng</button>\r\n"
						+ "                        <span>Giảm 10%</span>\r\n"
						+ "                    </div>\r\n"
						+ "                </div>");
			}
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
