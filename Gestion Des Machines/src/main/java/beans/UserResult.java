package beans;

public class UserResult {
	private boolean result;
	private User user;
	public UserResult(boolean result, User user) {
		super();
		this.result = result;
		this.user = user;
	}
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
}
