package store.model.dao;
import static common.JDBCTemplate.close;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import store.model.vo.Review;
import store.model.vo.Store;

public class StoreDAO {
	private Properties prop = new Properties();
	
	public StoreDAO() {
		try {
			//클래스객체 위치찾기 : 절대경로를 반환한다. 
			String fileName = StoreDAO.class.getResource("/sql/store/store-query.properties").getPath();
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	public Store selectOne(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOne");
		//select * from store_info where board_no = ?
		Store s = null;
		try{
			//미완성쿼리문을 가지고 객체생성. 
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			
			//쿼리문실행
			//완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			rset = pstmt.executeQuery();
			while(rset.next()){
				s = new Store();
				//컬럼명은 대소문자 구분이 없다.
				s.setBoard_no(rset.getInt("board_no"));
				s.setMember_id(rset.getString("member_id"));
				s.setStore_name(rset.getString("store_name"));
				s.setStore_phone(rset.getString("store_phone"));
				s.setLocation(rset.getString("location"));
				s.setClosing_day(rset.getString("closing_day"));
				s.setOpen_hours(rset.getString("open_hours"));
				s.setClose_hours(rset.getString("close_hours"));
				s.setBreaktime_open(rset.getString("breaktime_open"));
				s.setBreaktime_close(rset.getString("breaktime_close"));
				s.setMenu(rset.getString("menu"));
				s.setParking(rset.getString("parking"));
				s.setReservation_num(rset.getInt("reservation_num"));
				s.setView_num(rset.getInt("view_num"));
				s.setInfo_del_yn(rset.getString("info_del_yn"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return s;
	}
	
	public Review selectreviewOne(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectreviewOne");
		//select * from review where member_id ='?' and board_no = '?';
		Review review = null;
		try{
			//미완성쿼리문을 가지고 객체생성. 
			pstmt = conn.prepareStatement(query);
			//pstmt.setString(1, memberId);
			pstmt.setInt(1, boardNo);
			
			//쿼리문실행
			//완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			rset = pstmt.executeQuery();
			while(rset.next()){
				review = new Review();
				//컬럼명은 대소문자 구분이 없다.
				review.setReview_no(rset.getInt("review_no"));
				review.setReview_content(rset.getString("review_content"));
				review.setReview_date(rset.getDate("review_date"));
				review.setRating(rset.getInt("rating"));
				review.setBoard_no(rset.getInt("board_no"));
				review.setMember_id(rset.getString("member_id"));
				review.setReview_del_yn(rset.getString("review_del_yn"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return review;
	}

}
