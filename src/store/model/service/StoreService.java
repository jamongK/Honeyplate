package store.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import store.model.dao.StoreDAO;
import store.model.vo.Review;
import store.model.vo.Store;

public class StoreService {

	private StoreDAO storedao = new StoreDAO();
	
	public Store selectOne(int boardNo) {
		Connection conn = getConnection();
		Store board = storedao.selectOne(conn, boardNo);
		close(conn);
		return board;
	}
	
	public Review selectreviewOne(int boardNo) {
		Connection conn = getConnection();
		Review review = storedao.selectreviewOne(conn, boardNo);
		close(conn);
		return review;
	}

}
