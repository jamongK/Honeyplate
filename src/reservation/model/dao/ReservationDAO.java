package reservation.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import reservation.model.vo.Reservation;

public class ReservationDAO {
	private Properties prop = new Properties();
	
	public ReservationDAO() {
		String fileName = "/sql/reservation/reservation-query.properties";
		String path = ReservationDAO.class.getResource(fileName).getPath();
		
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Reservation> selectReservationList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReservationList");
		List<Reservation> reservationList = new ArrayList<Reservation>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				reservationList.add(setReservation(rset));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return reservationList;
	}

	public int insertReservation(Connection conn, Reservation reservation) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reservation.getMemberId());
			pstmt.setInt(2, reservation.getBoardNo());
			pstmt.setInt(3, reservation.getAdult());
			pstmt.setInt(4, reservation.getChild());
			pstmt.setTimestamp(5, reservation.getRsvDate());
			pstmt.setInt(6, reservation.getNoShow());
			pstmt.setString(7, reservation.getReservationPhone());
			pstmt.setString(8, reservation.getDepositYn());
			pstmt.setObject(9, reservation.getReservationStatus());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public List<Reservation> selectReservationListOwner(Connection conn, String memberId) {
		String sql = prop.getProperty("selectReservationListOwner");
		sql = sql.replace("#", memberId);
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Reservation> reservationListOwner = new ArrayList<Reservation>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				reservationListOwner.add(setReservation(rset));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return reservationListOwner;
	}
	
	public List<Reservation> selectReservationListCustomer(Connection conn, String memberId) {
		String sql = prop.getProperty("selectReservationListCustomer");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Reservation> reservationListCustomer = new ArrayList<Reservation>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			System.out.println(memberId);
			
			while(rset.next()) {
				reservationListCustomer.add(setReservation(rset));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return reservationListCustomer;
	}
	
	public Reservation selectReservationListDetailsOwner(Connection conn, int reservationNo) {
		String sql = prop.getProperty("selectReservationListDetailsOwner");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Reservation reservation = new Reservation();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reservationNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				reservation = setReservation(rset);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return reservation;
	}
	
	public int updateReservationStatus(Connection conn, int boardNo) {
		String sql = prop.getProperty("updateReservationStatus");
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
	private Reservation setReservation(ResultSet rset) throws SQLException {
		Reservation rsv = new Reservation(); 

		rsv.setReservationNo(rset.getInt("reservation_no"));
		rsv.setMemberId(rset.getString("member_id"));
		rsv.setBoardNo(rset.getInt("board_no"));
		rsv.setAdult(rset.getInt("adult"));
		rsv.setChild(rset.getInt("child"));
		rsv.setRsvDate(rset.getTimestamp("rsv_date"));
		rsv.setNoShow(rset.getInt("no_show"));
		rsv.setReservationPhone(rset.getString("reservation_phone"));
		rsv.setDepositYn(rset.getString("deposit_yn"));
		rsv.setReservationStatus(rset.getString("reservation_status"));
		
		return rsv;
	}









	
}
