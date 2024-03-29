package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.BidDAO;
import model.Goods;

@WebServlet("/BuyResultController")
public class BuyResultController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		HttpSession session=request.getSession();
		String str = session.getAttribute("user_id").toString();
		int user_id = Integer.parseInt(str);


		int price = Integer.parseInt(request.getParameter("price"));


		Goods gds = (Goods)session.getAttribute("goods");
		int goods_id = gds.getGoods_id();

		BidDAO dao = new BidDAO();
		String path ="/jsp/buy_result.jsp";
		path=dao.buyItem(user_id, price, goods_id);


		ServletContext context=getServletContext();
		RequestDispatcher rd=context.getRequestDispatcher(path);
		rd.forward(request, response);
	}

}
