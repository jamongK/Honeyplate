package store.model.vo;

import java.sql.Date;

public class Review {

	private int review_no;
	private String review_content;
	private Date review_date;
	private int rating;
	private int board_no;
	private String member_id;
	private String review_del_yn;
	
	
	public Review() {
		super();
		
	}
	public Review(int review_no, String review_content, Date review_date, int rating, int board_no, String member_id,
			String review_del_yn) {
		super();
		this.review_no = review_no;
		this.review_content = review_content;
		this.review_date = review_date;
		this.rating = rating;
		this.board_no = board_no;
		this.member_id = member_id;
		this.review_del_yn = review_del_yn;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getReview_del_yn() {
		return review_del_yn;
	}
	public void setReview_del_yn(String review_del_yn) {
		this.review_del_yn = review_del_yn;
	}
	
	@Override
	public String toString() {
		return "Review [review_no=" + review_no + ", review_content=" + review_content + ", review_date=" + review_date
				+ ", rating=" + rating + ", board_no=" + board_no + ", member_id=" + member_id + ", review_del_yn="
				+ review_del_yn + "]";
	}
	
	
}
