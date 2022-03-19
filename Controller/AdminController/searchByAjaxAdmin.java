package AdminController;

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
 * Servlet implementation class searchByAjaxAdmin
 */
@WebServlet("/searchByAjaxAdmin")
public class searchByAjaxAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchByAjaxAdmin() {
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
			String search = request.getParameter("search");
			DienThoaiBO bo = new DienThoaiBO();
			ArrayList<DienThoaibean> ds = null;
			if(search.equals("")) {
				ds = bo.getAllDienThoaiBO();
				for(DienThoaibean o : ds) {
					out.println("<div class=\"col3 item\">\r\n"
							+ "	                            <img src=\""+o.getAnh()+"\" alt=\"\" class=\"img_product\">\r\n"
							+ "	                            <div class=\"info_item\">\r\n"
							+ "	                                <p class=\"product__name\">"+o.getTenDienThoai()+"</p>\r\n"
							+ "	                                <p class=\"product__price\">Giá: <span class=\"gia\">"+o.getGia()+"</span>đ</p>\r\n"
							+ "	                                <p class=\"product__soluongcon\">Còn: "+o.getSoLuong()+"</p>\r\n"
							+ "	                                <input type=\"number\" name=\"slsp\" min=\"1\" placeholder=\"nhập số lượng\" style=\"margin-bottom: 4px;\" value=\"1\">\r\n"
							+ "	                                <button class=\"btn btn-primary\" onclick=\"themHang(this,'"+o.getMaDienThoai()+"')\">Thêm</button>\r\n"
							+ "	                            </div>\r\n"
							+ "	                        </div>");
				}
			}else {
				ds = bo.SearchBO(search);
				for(DienThoaibean o : ds) {
					out.println("<div class=\"col3 item\">\r\n"
							+ "	                            <img src=\""+o.getAnh()+"\" alt=\"\" class=\"img_product\">\r\n"
							+ "	                            <div class=\"info_item\">\r\n"
							+ "	                                <p class=\"product__name\">"+o.getTenDienThoai()+"</p>\r\n"
							+ "	                                <p class=\"product__price\">Giá: <span class=\"gia\">"+o.getGia()+"</span>đ</p>\r\n"
							+ "	                                <p class=\"product__soluongcon\">Còn: "+o.getSoLuong()+"</p>\r\n"
							+ "	                                <input type=\"number\" name=\"slsp\" min=\"1\" placeholder=\"nhập số lượng\" style=\"margin-bottom: 4px;\" value=\"1\">\r\n"
							+ "	                                <button class=\"btn btn-primary\" onclick=\"themHang(this,'"+o.getMaDienThoai()+"')\">Thêm</button>\r\n"
							+ "	                            </div>\r\n"
							+ "	                        </div>");
				}
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
