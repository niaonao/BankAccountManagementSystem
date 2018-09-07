package cn.hpu.edu.web.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.hpu.edu.common.action.struts.BaseAction;
import cn.hpu.edu.common.util.Constant;
import cn.hpu.edu.common.util.MD5;
import cn.hpu.edu.common.util.MessageUtil;
import cn.hpu.edu.common.util.StringUtil;
import cn.hpu.edu.entity.SessionBean;
import cn.hpu.edu.entity.user.SimpleUser;
import cn.hpu.edu.entity.user.SuperUser;
import cn.hpu.edu.entity.user.SysUser;
import cn.hpu.edu.entity.user.User;
import cn.hpu.edu.web.service.impl.BaseSysService;

/**
 * 用户登录action 响应类
 * @author niaonao
 *
 */
@ParentPackage("struts-default")
@Namespace("/com")
@Component
public class SignAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	@Autowired
	private BaseSysService service;

	@Action(value = "/login", results = { @Result(name = "index", type = "redirect", location = "/index.jsp"),
			@Result(name = "main", location = "/WEB-INF/jsp/main.jsp") })
	public String login() throws Exception {
		log.info(loginid + " " + password + " " + logintype);
		if (loginid.equals("root") && logintype.equals("SysUser")) {//超级管理,且是从管理入口登入
			logintype = "SuperUser";
		}
		String errorMessage = null;
		try {
			HttpSession session = getHttpSession();
			String code = (String) session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
			code = (String) getHttpSession().getAttribute("KAPTCHA_SESSION_KEY");
			if (code == null) {
				getHttpServletRequest().getSession(false).invalidate();
				return "index";
			} else {
			}
			checkcode = StringUtil.stringVerification(checkcode);//获取文本框输入的验证码
			if (code.toLowerCase().equals(checkcode.toLowerCase())) {
				loginid = StringUtil.stringVerification(loginid).toLowerCase();
				MD5 md = new MD5();
				password = md.getMD5ofStr(password);
				Object user = service.findUser(logintype, loginid, password);
				if (user != null) {

					SessionBean sb = new SessionBean();
					sb.setUser(user);
	
					getHttpSession().setAttribute(Constant.SESSION_BEAN, sb);

					log.info("登录成功:" + loginid);

				} else {
					errorMessage = "登录帐号或者密码错误";
				}
			} 
			else {
				errorMessage = "验证码错误";
			}
			if (errorMessage == null) {
				return "main";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (errorMessage == null) {
			errorMessage = "登录失败,请稍候重试";
		}
		getHttpSession().setAttribute("signErrorMessage", errorMessage);
		return "index";
	}

	/**
	 * 个人资料
	 * @return
	 */
	@Action(value = "toSelf", results = { @Result(name = "modifySelf", location = "/WEB-INF/jsp/modifySelf.jsp") })
	public String toSelf() {
		return "modifySelf";
	}
	private User bean;
	/**
	 * 更新个人资料
	 * @return
	 */
	@Action(value = "modifySelf")
	public String modifySelf() {
		try {
			User sessionUser = null;
			SessionBean sb = (SessionBean) getSessionValue(Constant.SESSION_BEAN);
			Object sbuser = sb.getUser();
			
			if (SysUser.class.getSimpleName().equals(sb.getRole())) {
				sessionUser = ((SysUser) sbuser).getUser();
			} else if (SimpleUser.class.getSimpleName().equals(sb.getRole())) {
				sessionUser = ((SimpleUser) sbuser).getUser();
			} else if (SuperUser.class.getSimpleName().equals(sb.getRole())) {
				sessionUser = ((SuperUser) sbuser).getUser();
			}
			
			bean.setUserId(sessionUser.getUserId());
			bean.setUname(sessionUser.getUname());
			if (StringUtil.notEmpty(bean.getUserPassword())) {
				MD5 md = new MD5();
				String password = md.getMD5ofStr(bean.getUserPassword());
				bean.setUserPassword(password);
			} else {
				bean.setUserPassword(sessionUser.getUserPassword());
			}
			service.update(bean);

			sessionUser.setUserAddress(bean.getUserAddress());
			sessionUser.setUserBirth(bean.getUserBirth());
			sessionUser.setUserEmail(bean.getUserEmail());
			sessionUser.setUserGender(bean.getUserGender());
			sessionUser.setUserName(bean.getUserName());
			sessionUser.setUserPhone(bean.getUserPhone());

			MessageUtil.addMessage(getHttpServletRequest(), "修改成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(getHttpServletRequest(), "修改失败.");
			return ERROR;
		}
	}

	@Action(value = "logout", results = { @Result(name = "logout", type = "redirect", location = "/index.jsp") })
	public String logout() {
		getHttpSession().invalidate();
		return "logout";
	}

	
	
	public User getBean() {
		return bean;
	}

	public void setBean(User bean) {
		this.bean = bean;
	}

	private String loginid;
	private String password;
	private String logintype;
	private String checkcode;

	public String getLoginid() {
		return loginid;
	}

	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLogintype() {
		return logintype;
	}

	public void setLogintype(String logintype) {
		this.logintype = logintype;
	}

	public String getCheckcode() {
		return checkcode;
	}

	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}

}
