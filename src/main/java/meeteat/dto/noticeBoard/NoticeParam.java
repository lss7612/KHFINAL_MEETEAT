package meeteat.dto.noticeBoard;

public class NoticeParam {
	
	private String noticeKeyword;
	private String noticeSearch;
	
	@Override
	public String toString() {
		return "NoticeParam [noticeKeyword=" + noticeKeyword + ", noticeSearch=" + noticeSearch + "]";
	}

	public String getNoticeKeyword() {
		return noticeKeyword;
	}

	public void setNoticeKeyword(String noticeKeyword) {
		this.noticeKeyword = noticeKeyword;
	}

	public String getNoticeSearch() {
		return noticeSearch;
	}

	public void setNoticeSearch(String noticeSearch) {
		this.noticeSearch = noticeSearch;
	}
	
	

}
