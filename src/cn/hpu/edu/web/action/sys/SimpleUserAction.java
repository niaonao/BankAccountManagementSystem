package cn.hpu.edu.web.action.sys;

import java.util.LinkedList;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.hpu.edu.common.action.struts.BaseAction;
import cn.hpu.edu.common.util.Constant;
import cn.hpu.edu.common.util.DateUtil;
import cn.hpu.edu.common.util.FieldUtil;
import cn.hpu.edu.common.util.MessageUtil;
import cn.hpu.edu.common.util.Page;
import cn.hpu.edu.common.util.SearchParamBean;
import cn.hpu.edu.common.util.StringUtil;
import cn.hpu.edu.entity.user.SimpleUser;
import cn.hpu.edu.entity.user.User;
import cn.hpu.edu.web.service.impl.BaseSysService;

import com.opensymphony.xwork2.ModelDriven;

/**
 * 银行柜员用户action 响应类
 * @author niaonao
 */
@ParentPackage("struts-default")
@Namespace("/sys")
@Component
public class SimpleUserAction extends BaseAction implements ModelDriven<SimpleUser> {
	private static final long serialVersionUID = 1L;

	@Autowired
	private BaseSysService service;

	private int uid;
	private SimpleUser bean = new SimpleUser();

	/**
	 * 跳转添加柜员页面
	 * @return
	 */
	@Action(value = "add2SimpleUser", results = { @Result(name = "add2", location = "/WEB-INF/jsp/sys/addSimpleUser.jsp") })
	public String add2() {
		return "add2";
	}

	@Action(value = "getSimpleUser", results = { @Result(name = "getOne", location = "/WEB-INF/jsp/sys/modifySimpleUser.jsp") })
	public String get() {
		try {
			SimpleUser temp = (SimpleUser) service.get(SimpleUser.class, uid);
			putRequestValue("modifybean", temp);
			return "getOne";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	@Action(value = "deleteSimpleUser")
	public String delete() {
		try {
			service.delete(SimpleUser.class, ids);
			MessageUtil.addRelMessage(getHttpServletRequest(), "删除用户信息成功.", "mainquery");
			return SUCCESS;
		} catch (Exception e) {
			MessageUtil.addMessage(getRequest(), "删除失败");
			return ERROR;
		}
	}

	@SuppressWarnings("static-access")
	@Action(value = "updateSimpleUser")
	public String update() {
		try {
			
			//日期判定
			if (bean.getUser().getUserBirth()!=null) {
				String birth = bean.getUser().getUserBirth();
				if (!DateUtil.getInstance().isAdult(birth)) {
					MessageUtil.addMessage(getRequest(), "出生日期显示用户不满18周岁");
					return ERROR;
				}
				
				if (DateUtil.getInstance().isOldness(birth)) {
					MessageUtil.addMessage(getRequest(), "出生日期显示用户超出65周岁");
					return ERROR;
				}
			}
			//用户基本信息防重复验证,就是除了账号密码之外的其他信息安全重复
			Integer userGender = bean.getUser().getUserGender();
			String userName = null == bean.getUser().getUserName() ? "" : bean.getUser().getUserName();
			String userPhone = null == bean.getUser().getUserPhone() ? "" : bean.getUser().getUserPhone();
			String userEmail = null == bean.getUser().getUserEmail() ? "" : bean.getUser().getUserEmail();
			String userBirth = null == bean.getUser().getUserBirth() ? "" : bean.getUser().getUserBirth();
			String userAddress = null == bean.getUser().getUserAddress() ? "" : bean.getUser().getUserAddress();
			User baseuser = service.findUser(userName, userGender, userPhone, userEmail, userBirth, userAddress);
			if (null != baseuser) {
				MessageUtil.addMessage(getRequest(), "用户信息已存在！");
				return ERROR;
			}
			service.updateSimpleUser(bean);
			MessageUtil.addMessage(getHttpServletRequest(), "更新用户成功.");
			return SUCCESS;
		} catch (Exception e) {
			MessageUtil.addMessage(getRequest(), "更新用户失败");
			return ERROR;
		}
	}

	/**
	 * 提交柜员信息后保存动作
	 * @return
	 */
	@SuppressWarnings("static-access")
	@Action(value = "addSimpleUser")
	public String add() {
		try {
			//用户名被占用判定
			User user = service.findUserByUname(bean.getUser().getUname());
			if (null !=user ) {
				MessageUtil.addMessage(getRequest(), "用户名"+bean.getUser().getUname()+"已被使用！");
				return ERROR;
			}
			//日期判定
			if (bean.getUser().getUserBirth()!=null) {
				String birth = bean.getUser().getUserBirth();
				if (!DateUtil.getInstance().isAdult(birth)) {
					MessageUtil.addMessage(getRequest(), "出生日期显示用户不满18周岁");
					return ERROR;
				}
				
				if (DateUtil.getInstance().isOldness(birth)) {
					MessageUtil.addMessage(getRequest(), "出生日期显示用户超出65周岁");
					return ERROR;
				}
			}
			//用户基本信息防重复验证,就是除了账号密码之外的其他信息安全重复
			Integer userGender = bean.getUser().getUserGender();
			String userName = null == bean.getUser().getUserName() ? "" : bean.getUser().getUserName();
			String userPhone = null == bean.getUser().getUserPhone() ? "" : bean.getUser().getUserPhone();
			String userEmail = null == bean.getUser().getUserEmail() ? "" : bean.getUser().getUserEmail();
			String userBirth = null == bean.getUser().getUserBirth() ? "" : bean.getUser().getUserBirth();
			String userAddress = null == bean.getUser().getUserAddress() ? "" : bean.getUser().getUserAddress();
			User baseuser = service.findUser(userName, userGender, userPhone, userEmail, userBirth, userAddress);
			if (null != baseuser) {
				MessageUtil.addMessage(getRequest(), "用户信息已存在！");
				return ERROR;
			}
			service.addSimpleUser(bean);
			MessageUtil.addMessage(getHttpServletRequest(), "添加用户成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(getRequest(), "添加用户失败");
			return ERROR;
		}
	}

	/**
	 * 柜员信息分页查询实现
	 * @return
	 */
	@Action(value = "querySimpleUser", results = { @Result(name = "queryList", location = "/WEB-INF/jsp/sys/listSimpleUser.jsp") })
	public String query() {
		try {
			int pageNum = 0;
			String t = getHttpServletRequest().getParameter("pageNum");
			if (StringUtil.notEmpty(t)) {
				pageNum = Integer.valueOf(t);
			}
			Page p = (Page) getHttpSession().getAttribute(Constant.SESSION_PAGE);
			if (pageNum == 0 || p == null) {
				p = new Page();
				p.setCurrentPageNumber(1);
				p.setTotalNumber(0l);
				p.setItemsPerPage(Constant.SESSION_PAGE_NUMBER);

				// 字段名称集合
				LinkedList<String> parmnames = new LinkedList<String>();
				// 字段值集合
				LinkedList<Object> parmvalues = new LinkedList<Object>();
				// 页面参数集合
				@SuppressWarnings("rawtypes")
				Set parm = getHttpServletRequest().getParameterMap().entrySet();
				for (Object o : parm) {
					@SuppressWarnings("unchecked")
					Entry<String, Object> e = (Entry<String, Object>) o;
					String name = e.getKey();// 页面字段名称
					if (name.startsWith("s_")) {
						String fieldValue = getHttpServletRequest().getParameter(name);// 检索账户名
						if (StringUtil.notEmpty(fieldValue)) {
							name = name.substring(2, name.length());// 实体字段名称
							parmnames.add(name);
							parmvalues.add(FieldUtil.format(SimpleUser.class, name, fieldValue));
						}
					}
				}

				SearchParamBean sbean = new SearchParamBean();
				sbean.setParmnames(parmnames);
				sbean.setParmvalues(parmvalues);

				p.setConditonObject(sbean);
			} else {
				p.setCurrentPageNumber(pageNum);
			}
			Page page = null;
			page = service.find(p, SimpleUser.class);

			getHttpSession().setAttribute(Constant.SESSION_PAGE, page);
			return "queryList";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public SimpleUser getModel() {
		return bean;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	private String ids;

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

}
