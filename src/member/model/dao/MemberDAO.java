package member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import reservation.model.dao.ReservationDAO;

public class MemberDAO {
	private Properties prop = new Properties();
	
	public MemberDAO() {
		String fileName = "/sql/member/member-query.properties";
		String path = MemberDAO.class.getResource(fileName).getPath();
		
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectNoshowFreq(Connection conn, String memberId) {
		String sql = prop.getProperty("selectNoshowFreq");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int noshowFreq = -1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) noshowFreq = rset.getInt("noshow_freq");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return noshowFreq;
	}

}
