package AdminController;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bo.ThongSoKyThuatBO;
import bo.admin_dienthoaiBO;

/**
 * Servlet implementation class themdienthoaimoi
 */
@WebServlet("/themdienthoaimoi")
public class themdienthoaimoi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public themdienthoaimoi() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		DiskFileItemFactory factory = new DiskFileItemFactory();
		HttpSession session = request.getSession();
		String madt = null, tendt = null, mansx = null, anh = null;
		int gia = 0, soluong = 0;
		String kichthuocmanhinh = null, congnghemanhinh = null, camerasau = null, cameratruoc = null, chipset = null,
				ram = null, rom = null, pin = null, thesim = null, hedieuhanh = null, dophangiaimanhinh = null,
				loaicpu = null, kichthuoc = null;
		admin_dienthoaiBO dtbo = new admin_dienthoaiBO();
		ThongSoKyThuatBO tsktbo = new ThongSoKyThuatBO();
		String dirURL = request.getServletContext().getRealPath("") + "image_dienthoai";
		File fdir = new File(dirURL);
		if (!fdir.exists())
			fdir.mkdir();

		ServletContext servletContext = this.getServletConfig().getServletContext();
		File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		factory.setRepository(repository);

		ServletFileUpload upload = new ServletFileUpload(factory);

		// Parse the request
		try {
			List<FileItem> items = upload.parseRequest(request);
			Iterator<FileItem> iter = items.iterator();
			HashMap<String, String> fields = new HashMap<String, String>();
			String fileName = null;
			while (iter.hasNext()) {
				FileItem item = iter.next();
				if (item.isFormField()) {
					fields.put(item.getFieldName(), item.getString());
					String t = item.getFieldName();
					if (t.equals("txtMaDT")) {
						madt = item.getString("utf-8");
						boolean kt = dtbo.KiemTraMaDTBO(madt);
						if (kt) {
							session.setAttribute("trungma", "1");
							response.sendRedirect("HomeAdmin");
							return;
						}
					}
					if (t.equals("txtTenDT")) {
						tendt = item.getString("utf-8");
					}
					if (t.equals("txtGia")) {
						gia = Integer.parseInt(item.getString());
					}
					if (t.equals("txtLoaiDT")) {
						mansx = item.getString("utf-8");
					}
					if (t.equals("txtSoLuong")) {
						soluong = Integer.parseInt(item.getString());
					}
					if (t.equals("txtKTMH")) {
						kichthuocmanhinh = item.getString("utf-8") + " inches";
					}
					if (t.equals("txtCNMH")) {
						congnghemanhinh = item.getString("utf-8");
					}
					if (t.equals("txtCamSau")) {
						camerasau = item.getString("utf-8");
					}
					if (t.equals("txtCamTruoc")) {
						cameratruoc = item.getString("utf-8");
					}
					if (t.equals("txtChipset")) {
						chipset = item.getString("utf-8");
					}
					if (t.equals("txtRAM")) {
						ram = item.getString("utf-8") + " GB";
					}
					if (t.equals("txtROM")) {
						rom = item.getString("utf-8") + " GB";
					}
					if (t.equals("txtPin")) {
						pin = item.getString("utf-8");
					}
					if (t.equals("txtSim")) {
						thesim = item.getString("utf-8");
					}
					if (t.equals("txtOS")) {
						hedieuhanh = item.getString("utf-8");
					}
					if (t.equals("txtDPGMH")) {
						dophangiaimanhinh = item.getString("utf-8");
					}
					if (t.equals("txtCPU")) {
						loaicpu = item.getString("utf-8");
					}
					if (t.equals("txtKT")) {
						kichthuoc = item.getString("utf-8");
					}
				} else {
					fileName = item.getName();
					if (fileName != null && fileName != "") {
						String time = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
						Path path = Paths.get(time + "-" + fileName);
						String storePath = servletContext.getRealPath("/image_dienthoai");
						File uploadFile = new File(storePath + "/" + path.getFileName());
						item.write(uploadFile);
						anh = "image_dienthoai/" + time + "-" + fileName;
					}
				}
			}
			dtbo.ThemDienThoaiBO(madt, tendt, gia, mansx, anh, soluong);
			tsktbo.ThemTSKTBO(madt, kichthuocmanhinh, congnghemanhinh, camerasau, cameratruoc, chipset, ram, rom, pin,
					thesim, hedieuhanh, dophangiaimanhinh, loaicpu, kichthuoc);
			session.setAttribute("upfile", "1");
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("HomeAdmin");
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
