package cn.hpu.edu.entity;

import java.io.Serializable;
/**
 * Session 管理，登录校验
 * @author niaonao
 */
public class SessionBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Object user;

	public Object getUser() {
		return user;
	}

	public void setUser(Object user) {
		this.user = user;
	}

	/**
	 * user权限管理
	 * 类的简写名称
	 * @return
	 */
	public String getRole() {
		if (user == null) {
			return "";
		}
		//通过simplename进行权限管理
		String ret = user.getClass().getSimpleName();
		return ret;
	}

}
