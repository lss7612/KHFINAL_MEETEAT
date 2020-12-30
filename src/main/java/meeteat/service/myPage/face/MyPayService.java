package meeteat.service.myPage.face;

import meeteat.dto.myPage.MyPay;
import meeteat.dto.user.User;

public interface MyPayService {

	/** 
	 * 결제 정보 등록
	 * @param myPay
	 */
	public void insertPayInfo(MyPay myPay);

	/**
	 * 결제 여부 체크
	 * @param user_no
	 * @return
	 */
	public boolean payChk(int user_no);

	/**
	 * 결제 성공하고 User 등급 업데이트
	 * @param user_no
	 */
	public void updateUser(int user_no);

	/**
	 * 결제 해지하기
	 * @param user
	 */
	public void deletePayInfo(User user);

	/**
	 * 결제 해지로 바꾸도 User 등급 업데이트
	 * @param user
	 */
	public void updateUserInfo(User user);

}
