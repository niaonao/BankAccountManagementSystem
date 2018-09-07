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
import cn.hpu.edu.entity.user.SysUser;
import cn.hpu.edu.entity.user.User;
import cn.hpu.edu.web.service.impl.BaseSysService;

import com.opensymphony.xwork2.ModelDriven;

/**
 * 系统管理员action 响应类
 * @author niaonao
 *
 */
@ParentPackage("struts-default")
@Namespace("/sys")
@Component
public class SysUserAction extends BaseAction implements ModelDriven<SysUser> {

	private static final long serialVersionUID = 1L;

	@Autowired
	private BaseSysService service;

	private int uid;
	private SysUser bean = new SysUser();

	@Action(value = "add2SysUser", results = { @Result(name = "add2", location = "/WEB-INF/jsp/sys/addSysUser.jsp") })
	public String add2() {
		return "add2";
	}
	
	@Action(value = "getSysUser", results = { @Result(name = "getOne", location = "/WEB-INF/jsp/sys/modifySysUser.jsp") })
	public String get() {
		try {
			SysUser temp = (SysUser) service.get(SysUser.class, uid);
			putRequestValue("modifybean", temp);
			return "getOne";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	@Action(value = "deleteSysUser")
	public String delete() {
		try {
			service.delete(SysUser.class, ids);
			MessageUtil.addRelMessage(getHttpServletRequest(), "删除管理员信息成功.", "mainquery");
			return SUCCESS;
		} catch (Exception e) {
			MessageUtil.addMessage(getRequest(), "删除失败");
			return ERROR;
		}
	}

	@SuppressWarnings("static-access")
	@Action(value = "updateSysUser")
	public String update() {
		try {
			//1.身份年龄验证
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
			
			//2.用户验证：用户基本信息防重复验证,就是除了账号密码之外的其他信息安全重复
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
			service.updateSysUser(bean);
			MessageUtil.addMessage(getHttpServletRequest(), "更新管理员成功.");
			return SUCCESS;
		} catch (Exception e) {
			MessageUtil.addMessage(getRequest(), "更新管理员失败");
			return ERROR;
		}
	}

	@SuppressWarnings("static-access")
	@Action(value = "addSysUser")
	public String add() {
		try {
			//1.用户验证
			User user = service.findUserByUname(bean.getUser().getUname());
			if (user != null) {
				MessageUtil.addMessage(getRequest(), "用户名"+bean.getUser().getUname()+"已被使用！");
				return ERROR;
			}
			//2.用户验证
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
			
			//3.用户验证：用户基本信息防重复验证,就是除了账号密码之外的其他信息安全重复
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
			//4.添加用户
			service.addSysUser(bean);
			MessageUtil.addMessage(getHttpServletRequest(), "添加管理员成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(getRequest(), "添加管理员失败");
			return ERROR;
		}
	}

	@Action(value = "querySysUser", results = { @Result(name = "queryList", location = "/WEB-INF/jsp/sys/listSysUser.jsp") })
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
						String fieldValue = getHttpServletRequest().getParameter(name);// 页面字段值
						if (StringUtil.notEmpty(fieldValue)) {
							name = name.substring(2, name.length());// 实体字段名称
							parmnames.add(name);
							parmvalues.add(FieldUtil.format(SysUser.class, name, fieldValue));
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
			page = service.find(p, SysUser.class);

			getHttpSession().setAttribute(Constant.SESSION_PAGE, page);
			return "queryList";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public SysUser getModel() {
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
