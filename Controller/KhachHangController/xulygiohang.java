package KhachHangController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.GioHangbean;
import bo.GioHangBO;

/**
 * Servlet implementation class xulygiohang
 */
@WebServlet("/xulygiohang")
public class xulygiohang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xulygiohang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");;
			String madienthoai = request.getParameter("madt");
			String soluong = request.getParameter("soluong");
			String act = request.getParameter("act");
			HttpSession session = request.getSession();
			PrintWriter out = response.getWriter();
			GioHangBO gh = null;
			if(session.getAttribute("gh") == null) {
				gh = new GioHangBO();
				session.setAttribute("gh", gh);
			}
			
			if(session.getAttribute("gh") != null) {
				gh = (GioHangBO)session.getAttribute("gh");
				
				if(session.getAttribute("datmua") != null) {
					String datmua = (String) session.getAttribute("datmua");
					if(datmua.equals("1")) {
						gh.XoaTatCa();
						session.setAttribute("gh", gh);
						response.sendRedirect("giohang");
						return;
					}
				}
				
				if(act != null && act.equals("delete")) {
					gh.Xoa1Hang(madienthoai);
					session.setAttribute("gh", gh);
					out.print("Tổng cộng: " + gh.TongTien()+" VNĐ"+";"+gh.ds.size());
					return;
				}
				
				if(act != null && act.equals("update")) {
					gh.CapNhatSoLuongMua(madienthoai, Integer.parseInt(soluong));
					session.setAttribute("gh", gh);
					out.print("Tổng cộng: " + gh.TongTien()+" VNĐ");
					return;
				}
				
				if(act != null && act.equals("clear")) {
					gh.XoaTatCa();
					session.setAttribute("gh", gh);
					return;
				}
				
				if(act != null && act.equals("remove")) {
					String dstra = request.getParameter("dstra");
					String[] txts = dstra.split("[;]");
					ArrayList<GioHangbean> ghbean = new ArrayList<GioHangbean>();
					for(int i = 0; i < txts.length; i++) {
						ghbean.add(gh.ds.get(Integer.parseInt(txts[i])));
					}
					for(GioHangbean g : ghbean) {
						gh.Xoa1Hang(g.getMaDienThoai());
					}
					session.setAttribute("gh", gh);
					out.print("Tổng cộng: " + gh.TongTien()+" VNĐ"+";"+gh.ds.size());
					return;
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
