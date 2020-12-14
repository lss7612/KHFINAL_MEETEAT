package meeteat.service.login.face;

import meeteat.dto.user.User;

public interface LoginService {

	public boolean login(User user);

	public User selectUser(User user);

	public User selectUserByUserNo(User user);

}
