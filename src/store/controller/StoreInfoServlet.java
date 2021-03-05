package store.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import store.model.service.StoreService;
import store.model.vo.Review;
import store.model.vo.Store;

/**
 * Servlet implementation class StoreInfoServlet
 */
@WebServlet("/store/storedetail") //아직이거없어서 오류남500번
public class StoreInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StoreService storeservice = new StoreService();
	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//1. 사용자 입력값 처리
		int boardNo = Integer.parseInt("1");
		//int boardNo = Integer.parseInt(request.getParameter("board_no"));
		
		//2. 업무로직 : 조회
			
		Store store = storeservice.selectOne(boardNo);
		System.out.println("store@StoreinfoServlet = " + store);
		//Review review = storeservice.selectreviewOne(boardNo);
		Review review = storeservice.selectreviewOne(boardNo);
		System.out.println("review@StoreinfoServlet = " + review);
		
		//3. view단처리 : jsp forwarding
		request.setAttribute("store", store);
		request.setAttribute("review", review);
		request.getRequestDispatcher("/storeview.jsp")
			   .forward(request, response);
	
	
	}

	

}