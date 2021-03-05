package reservation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import reservation.model.service.ReservationService;
import reservation.model.vo.Reservation;

@WebServlet("/reservation/listCustomer")
public class ReservationListViewCustomerServlet extends HttpServlet{
	private ReservationService reservationService = new ReservationService();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Member member = request.getParameter("memberLoggedIn");
		//String memberId = member.getMemberId();
		
		String memberId = "abc_123";
		List<Reservation> reservationListCustomer = reservationService.selectReservationListCustomer(memberId);
		
		new Gson().toJson(reservationListCustomer,response.getWriter());
		
		/* 박소연님 코드(필요시 주석 해제)
		 * System.out.println(reservationListCustomer);
		 */
	}
}
