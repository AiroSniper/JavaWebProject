package beans;

import java.util.List;

public class UserToCopy {

		private User user;
		private List<User> users;
		
		public User getUser() {
			return user;
		}
		public void setUser(User user) {
			this.user = user;
		}
		public List<User> getUsers() {
			return users;
		}
		public void setUsers(List<User> users) {
			this.users = users;
		}
		public UserToCopy(User user, List<User> users) {
			
			this.user = user;
			this.users = users;
		}
	
		
	
}
