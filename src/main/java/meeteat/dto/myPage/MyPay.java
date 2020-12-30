package meeteat.dto.myPage;

public class MyPay {
	private int user_no;
	private String imp_uid;
	private String merchant_uid;
	@Override
	public String toString() {
		return "MyPay [user_no=" + user_no + ", imp_uid=" + imp_uid + ", merchant_uid=" + merchant_uid + "]";
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}



}
