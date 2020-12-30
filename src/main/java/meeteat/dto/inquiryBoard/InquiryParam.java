package meeteat.dto.inquiryBoard;

public class InquiryParam {
	
	private int inquiryBoard_no;
	private String inquiryKeyword;
	private String inquirySearch;
	
	@Override
	public String toString() {
		return "InquiryParam [inquiryBoard_no=" + inquiryBoard_no + ", inquiryKeyword=" + inquiryKeyword
				+ ", inquirySearch=" + inquirySearch + "]";
	}

	public int getInquiryBoard_no() {
		return inquiryBoard_no;
	}

	public void setInquiryBoard_no(int inquiryBoard_no) {
		this.inquiryBoard_no = inquiryBoard_no;
	}

	public String getInquiryKeyword() {
		return inquiryKeyword;
	}

	public void setInquiryKeyword(String inquiryKeyword) {
		this.inquiryKeyword = inquiryKeyword;
	}

	public String getInquirySearch() {
		return inquirySearch;
	}

	public void setInquirySearch(String inquirySearch) {
		this.inquirySearch = inquirySearch;
	}
	

}
