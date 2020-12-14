package meeteat.dao.login.face;

import meeteat.dto.user.User;

public interface LoginDao {

	public int login(User user);

	public User selectUser(User user);

	public User selectUserByUserNo(User user);
	

}
