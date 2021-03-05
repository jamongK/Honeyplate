package reservation.controller;

import java.util.List;

import reservation.model.service.ReservationService;
import reservation.model.vo.Reservation;

public class JDBCTest {
	//JDBC 연결이 정상적으로 작동하는지 테스트하기 위한 메인 메서드 
	public static void main(String[] args) {
		ReservationService ser = new ReservationService();
		List<Reservation> list = ser.selectReservationList();
		
		System.out.println(list);
	}

}
