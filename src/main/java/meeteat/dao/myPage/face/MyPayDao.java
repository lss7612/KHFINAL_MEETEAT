package meeteat.dao.myPage.face;

import meeteat.dto.myPage.MyPay;
import meeteat.dto.user.User;

public interface MyPayDao {

	/**
	 * 결제 정보 업데이트
	 * @param myPay
	 */
	public void insertPayInfo(MyPay myPay);

	/**
	 * 결제 성공확인
	 * @param user_no
	 * @return
	 */
	public int payChk(int user_no);

	/**
	 * 결제 성공후 회원 등급 바꾸기
	 * @param user_no
	 */
	public void updateUser(int user_no);

	/**
	 * 결제 해지하기
	 * @param user
	 */
	public void deletePayInfo(User user);

	/**
	 * 결제 해지 후 회원 등급 바꾸기 
	 * @param user
	 */
	public void updateUserInfo(User user);


}
