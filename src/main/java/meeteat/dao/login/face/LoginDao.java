package meeteat.dao.login.face;

import meeteat.dto.user.User;

public interface LoginDao {

	public int login(User user);

	public User selectUser(User user);

	public User selectUserByUserNo(User user);
	
	public int userIdCheck(String user_id);

	public int userNickCheck(String user_nick);

	public void signUp(User user);
	

}
