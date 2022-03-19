package AdminController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DienThoaibean;
import bo.DienThoaiBO;
import bo.quanlyhoadonBO;

/**
 * Servlet implementation class themcthd
 */
@WebServlet("/themcthd")
public class themcthd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public themcthd() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			quanlyhoadonBO bo = new quanlyhoadonBO();
			String mahd = request.getParameter("mahd");
			String madt = request.getParameter("madt");
			int soluong = Integer.parseInt(request.getParameter("sl"));
			bo.ThemCTHDBO(mahd, madt, soluong);
			DienThoaiBO dtbo = new DienThoaiBO();
			int macthd = bo.MaCTHDVuaTaoBO();
			DienThoaibean dt = dtbo.getByMaDienThoaiBO(madt);
			out.println("<div class=\"product-item\">\r\n"
					+ "			                                        <div class=\"product-item__img\">\r\n"
					+ "			                                            <img class=\"img__item\" title=\"Ảnh\" src=\""+dt.getAnh()+"\">\r\n"
					+ "			                                        </div>\r\n"
					+ "			                                        <div class=\"product-item__info\">\r\n"
					+ "			                                            <div class=\"invoice-code\">\r\n"
					+ "			                                                <div>\r\n"
					+ "			                                                    Mã chi tiết hóa đơn:\r\n"
					+ "			                                                    <span style=\"color: #9d4edd; font-weight: 600\" class=\"macthd\">"+macthd+"</span>\r\n"
					+ "			                                                </div>\r\n"
					+ "			                                                <div>Trạng thái: <span class=\"trangthaicthd\">Chưa thanh toán</span></div>\r\n"
					+ "			                                            </div>\r\n"
					+ "			                                            <div class=\"product-item__name\">\r\n"
					+ "			                                                <span>"+dt.getTenDienThoai()+"</span>\r\n"
					+ "			                                            </div>\r\n"
					+ "			                                            <div class=\"product-item__price\">\r\n"
					+ "			                                                <div>Giá: "+dt.getGia()+"đ x\r\n"
					+ "			                                                    <span>\r\n"
					+ "			                                                        <input type=\"number\" value=\""+soluong+"\" min=\"1\" name=\"soluonghang\">\r\n"
					+ "			                                                        "
					+ "			                                                        	<button class=\"capnhatsl\">Cập nhật</button>\r\n"
					+ "			                                                        "
					+ "			                                                    </span>\r\n"
					+ "			                                                </div>\r\n"
					+ "			                                                <div style=\"font-size: 16px; font-weight: bold; color: #669bbc\">\r\n"
					+ "			                                                    <span class=\"tiencthd\">"+soluong * dt.getGia()+"</span> VNĐ\r\n"
					+ "			                                                </div>\r\n"
					+ "			                                            </div>\r\n"
					+ "			                                        </div>\r\n"
					+ "			                                        "
					+ "			                                        	<div class=\"CacNutBam\">\r\n"
					+ "				                                            <div class=\"nutBam\">\r\n"
					+ "				                                                <button class=\"btn btn-success xacnhancthd\">\r\n"
					+ "				                                                    <i class=\"fas fa-check\"></i>\r\n"
					+ "				                                                </button>\r\n"
					+ "				                                            </div>\r\n"
					+ "				                                            <div class=\"nutBam\">\r\n"
					+ "				                                                <button class=\"btn btn-danger xoacthd\">\r\n"
					+ "				                                                    <i class=\"fas fa-trash-alt\"></i>\r\n"
					+ "				                                                </button>\r\n"
					+ "				                                            </div>\r\n"
					+ "				                                        </div>\r\n"
					+ "			                                        "
					+ "			                                    </div>");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
