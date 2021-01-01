package meeteat.dto.reviewBoard;

public class ReviewSearch {
	
	private String review_search;
	private String review_keyword;
	
	public String getReview_search() {
		return review_search;
	}
	public void setReview_search(String review_search) {
		this.review_search = review_search;
	}
	public String getReview_keyword() {
		return review_keyword;
	}
	public void setReview_keyword(String review_keyword) {
		this.review_keyword = review_keyword;
	}
	
	@Override
	public String toString() {
		return "ReviewSearch [review_search=" + review_search + ", review_keyword=" + review_keyword + "]";
	}
	
}
