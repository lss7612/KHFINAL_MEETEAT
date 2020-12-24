package meeteat.service.login.face;

import meeteat.dto.user.User;

public interface LoginService {

	public boolean login(User user);

	public User selectUser(User user);

	public User selectUserByUserNo(User user);

	public boolean userIdCheck(String user_id);

	public boolean userNickCheck(String user_nick);

	public void signUp(User user);

}
