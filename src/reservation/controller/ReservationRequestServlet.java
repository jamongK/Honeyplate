package reservation.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import reservation.model.service.ReservationService;
import reservation.model.vo.Reservation;
import sun.java2d.pipe.SpanShapeRenderer.Simple;

@WebServlet("/reservation/request")
public class ReservationRequestServlet extends HttpServlet{
	private ReservationService reservationService = new ReservationService();
	private MemberService memberServcie = new MemberService();
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		try {
			
			String day = request.getParameter("input-day");
			String time = request.getParameter("timepicker");
			int child = Integer.parseInt(request.getParameter("child-num"));
			int adult = Integer.parseInt(request.getParameter("adult-num"));
			String memberId = request.getParameter("memberId");
			String phone = request.getParameter("customer-phone");
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));
			int noShow = memberServcie.selectNoshowFreq(memberId);
			
			day = day.substring(0,4) + "-" + day.substring(5,7) + "-" + day.substring(8,10) + " " + time + ":00.0";
			Timestamp rsvDate = Timestamp.valueOf(day);
			
			Reservation reservation = new Reservation(0, memberId, boardNo, adult, child, rsvDate, noShow, phone, "N", null);
			
			int result = reservationService.insertReservation(reservation);
			System.out.println("result is "  + result);
			
			if(result > 0) {
			}else {
				
			}
			
			
		} catch (Exception e) {
			throw e;
		}
	}
	
}
