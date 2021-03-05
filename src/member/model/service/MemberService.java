package member.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import member.model.dao.MemberDAO;
public class MemberService {
	private MemberDAO memberDAO = new MemberDAO();
	
	public int selectNoshowFreq(String memberId) {
		Connection conn = getConnection();
		int result =  memberDAO.selectNoshowFreq(conn, memberId);
		
		close(conn);
		return result;
	}

}
