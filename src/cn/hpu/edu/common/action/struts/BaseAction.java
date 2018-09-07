package cn.hpu.edu.common.action.struts;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import cn.hpu.edu.common.util.Constant;
import cn.hpu.edu.entity.SessionBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;

/**
 * struts 后台控制基类，响应struts 拦截的请求
 * @author niaonao
 *
 */
@SuppressWarnings("serial")
@Results({ @Result(name = "success", location = "/WEB-INF/jsp/common/success.jsp"), @Result(name = "error", location = "/WEB-INF/jsp/common/error.jsp") })
public class BaseAction extends ActionSupport implements RequestAware, SessionAware {
	private Map<String, Object> session;
	private Map<String, Object> request;
	protected static Logger log = Logger.getLogger(BaseAction.class);

	protected void putRequestValue(String name, Object value) {
		request.put(name, value);
	}

	protected void putSessionValue(String name, Object value) {
		session.put(name, value);
	}

	protected Object getRequestValue(String name) {
		return request.get(name);
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public Map<String, Object> getRequest() {
		return request;
	}

	protected Object getSessionValue(String name) {
		return session.get(name);
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	protected ActionContext getActionContext() {
		return ActionContext.getContext();
	}

	protected ValueStack getValueStack() {
		return getActionContext().getValueStack();
	}

	protected HttpServletRequest getHttpServletRequest() {
		HttpServletRequest request = ServletActionContext.getRequest();
		return request;
	}
	protected HttpServletResponse getHttpServletResponse() {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		return response;
	}

	protected HttpSession getHttpSession() {
		HttpServletRequest request = ServletActionContext.getRequest();
		return request.getSession();
	}
	protected Object getSessionUser() {
		SessionBean sb = (SessionBean) getHttpSession().getAttribute(Constant.SESSION_BEAN);
		return sb.getUser();
	}
}
