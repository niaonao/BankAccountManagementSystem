package cn.hpu.edu.web.action;

import java.util.LinkedList;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
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
import cn.hpu.edu.common.util.MathExtend;
import cn.hpu.edu.common.util.MessageUtil;
import cn.hpu.edu.common.util.Page;
import cn.hpu.edu.common.util.SearchParamBean;
import cn.hpu.edu.common.util.StringUtil;
import cn.hpu.edu.entity.Account;
import cn.hpu.edu.entity.Loan;
import cn.hpu.edu.web.service.impl.BaseSysService;

import com.opensymphony.xwork2.ModelDriven;

/**
 * 银行账户相关的action 请求响应类
 * @author niaonao
 */
@ParentPackage("struts-default")
@Namespace("/sys")
@Component
public class AccountAction extends BaseAction implements ModelDriven<Account> {
	private static final long serialVersionUID = 1L;

	@Autowired
	private BaseSysService service;

	private int uid;
	private String ids;
	private Account bean = new Account();
	private Loan loan = new Loan();

	@Action(value = "listLoan", results = { @Result(name = "list", location = "/WEB-INF/jsp/sys/listLoan.jsp") })
	public String listLoan() {
		if (StringUtils.isNotBlank(ids)) {
			ids = ids.trim();
			List<Loan> list = service.findLoanList(ids);

			// start 根据当前系统时间判断是否逾期未还
			boolean flag = false;// 标识是否发生信息变更
			String currentDate = DateUtil.getInstance().getCurrentTime();
			String endDate;// 还款截至日期
			for (Loan loan : list) {
				endDate = loan.getStartPayDate();
				long days = DateUtil.getInstance().expiryDays(endDate,
						currentDate);// 判断还款期限超过当前日期，并且还款状态不是"已还款"的记录
				String repayStatus = loan.getRepaystatus();
				if (days > 0 && !repayStatus.equals("已还款")) {// 逾期还款
					// 逾期还款则进行账户设置曾逾期还款
					String idCard = loan.getAccount().getIdcard();// 获取身份证
					List<Account> listAccounts = service
							.getAccountByIdcard(idCard);
					if (null != listAccounts) {
						for (Account acc : listAccounts) {
							acc.setOverduerepay(1);// 0否1是，存在逾期还款的记录
							service.update(acc);
						}

					}
					loan.setRepaystatus("逾期还款");
					// 计算逾期利息：基数*6%*利率*天数
					double rate = loan.getRate() / 100;
					double overdueMoney = (loan.getMonth() - loan
							.getRepaymonth()) * loan.getPerPayMoney();
					double overdueinterest = overdueMoney * rate * days * 6
							/ 100;
					loan.setOverdueinterest(overdueinterest);

					service.update(loan);
					flag = true;
				}
			}
			// end

			if (flag) {
				list = service.findLoanList(ids);
			}

			putRequestValue("list", list);
			if (list != null && list.size() > 0) {
				double total = 0;
				for (Loan l : list) {
					total += l.getPerPayMoney();
				}
				total = MathExtend.round(total, 2);
				putRequestValue("total", total);
			}
		}
		return "list";
	}
	
	/**
	 * 还款
	 * finally是loan列表
	 * @return
	 */
	@SuppressWarnings("finally")
	@Action(value = "repayLoan", results = { @Result(name = "list", location = "/WEB-INF/jsp/sys/listloanresult.jsp") })
	public String repayLoan() {
		String errorMessage = "还款成功";

		String[] names = ids.split("\\.");

		int tempid = Integer.parseInt(names[0]);// id
		Loan tempLoan = (Loan) service.get(Loan.class, tempid);

		String accountSid = tempLoan.getAccount().getSid();

		try {
			if (names.length < 2) {
				errorMessage = "请完善分期";
			}
			 if (names.length > 2) {
				errorMessage = "分期为整数";

			} else {
				String tempmonth = names[1];// huankuanfenqi
				int repaymonth = Integer.parseInt(tempmonth);

				if (tempLoan.getRepaystatus().equals("已还款")) {
					errorMessage = "已还款";
				} else if (tempLoan.getRepaystatus().equals("逾期还款")) {
					// 剩余期数一次还清,并将逾期利息还清。
					int notyetmonth = tempLoan.getMonth()
							- tempLoan.getRepaymonth();
					if (repaymonth != notyetmonth) {
						errorMessage = "请一次性还款";
					} else {
						// 已还分期更新，逾期利息更新,还款状态更新
						tempLoan.setRepaystatus("已还款");
						tempLoan.setRepaymonth(tempLoan.getMonth());
						tempLoan.setOverdueinterest(0);
					}

				} else {
					if (!StringUtil.isInteger(tempmonth)) {//
						errorMessage = "格式为整数";
					} else if (repaymonth < 1) {
						errorMessage = "分期过小";
						// 分期过小
					} else if (repaymonth > (tempLoan.getMonth() - tempLoan
							.getRepaymonth())) {
						errorMessage = "分期过大";
					} else {
						// 还款，更新还款分期即可，现金还款
						int alreadyRepay = repaymonth
								+ tempLoan.getRepaymonth();
						tempLoan.setRepaymonth(alreadyRepay);// 更新已还款分期
						if (alreadyRepay != 0) {
							tempLoan.setRepaystatus("还款中");
						}
						if (alreadyRepay == tempLoan.getMonth()) {// 还款完成，更新还款状态
							tempLoan.setRepaystatus("已还款");
						}
						service.update(tempLoan);
						// end huankuan
					}
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		} finally {
			List<Loan> list = service.findLoanList(accountSid);
			for (Loan loan : list) {
				if (loan.getId() == tempid) {
					loan.setDef01(errorMessage);// 设置错误信息
				}
			}
			putRequestValue("list", list);
			return "list";
		}
	}

	/**
	 * 获取loan详细
	 * 
	 * @return
	 */
	@Action(value = "getLoanDetail", results = { @Result(name = "getOne", location = "/WEB-INF/jsp/sys/showLoan.jsp") })
	public String getLoanDetail() {
		try {
			Loan temp = (Loan) service.get(Loan.class, uid);
			putRequestValue("modifybean", temp);
			return "getOne";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	@Action(value = "add2Loan", results = { @Result(name = "add2", location = "/WEB-INF/jsp/sys/loan.jsp") })
	public String add2Loan() {
		return "add2";
	}

	@Action(value = "addLoan")
	public String addLoan() {
		try {
			Loan temp = service.addLoan(loan);
			MessageUtil.addRelMessage(getHttpServletRequest(), "贷款成功. 截至还款日期: "
					+ temp.getStartPayDate(), "baseAdd");
			return SUCCESS;
		} catch (Exception e) {
			MessageUtil.addMessage(getRequest(), "贷款失败:" + e.getMessage());
			return ERROR;
		}
	}

	@Action(value = "add2UnlockAccount", results = { @Result(name = "add2", location = "/WEB-INF/jsp/sys/unlockAccount.jsp") })
	public String add2UnlockAccount() {
		return "add2";
	}

	@Action(value = "updateAccountUnlock")
	public String updateAccountUnlock() {
		try {
			service.updateAccountUnlock(bean);
			MessageUtil.addRelMessage(getHttpServletRequest(), "解锁成功.",
					"baseAdd");
			return SUCCESS;
		} catch (Exception e) {
			MessageUtil.addMessage(getRequest(), "解锁失败:" + e.getMessage());
			return ERROR;
		}
	}

	@Action(value = "listAccount", results = { @Result(name = "list", location = "/WEB-INF/jsp/sys/listAccount.jsp") })
	public String listAccount() {
		@SuppressWarnings("rawtypes")
		List list = service.findAllAccount(ids);
		putRequestValue("list", list);
		return "list";
	}

	@Action(value = "listAccountForLoan", results = { @Result(name = "list", location = "/WEB-INF/jsp/sys/listAccountForLoan.jsp") })
	public String listAccountForLoan() {
		@SuppressWarnings("rawtypes")
		List list = service.findAllAccount(ids);
		putRequestValue("list", list);
		return "list";
	}

	@Action(value = "updateAccountForLoan")
	public String updateAccountForLoan() {
		try {
			service.updateAccountForLoan(uid);
			MessageUtil.addRelMessage(getHttpServletRequest(), "设置贷款账号成功.",
					"mainquery");
			return SUCCESS;
		} catch (Exception e) {
			MessageUtil.addMessage(getRequest(), "设置贷款账号失败: " + e.getMessage());
			return ERROR;
		}
	}

	@Action(value = "updateAccountLost")
	public String updateAccountLost() {
		try {
			Account account = (Account) service.get(Account.class, uid);
			if (account.getStatus().equals("正常")) {
				account.setStatus("冻结");
			}
			service.update(account);
			MessageUtil.addRelMessage(getHttpServletRequest(), "冻结成功.",
					"mainquery");
			return SUCCESS;
		} catch (Exception e) {
			MessageUtil.addMessage(getRequest(), "冻结失败");
			return ERROR;
		}
	}

	@Action(value = "add2Account", results = { @Result(name = "add2", location = "/WEB-INF/jsp/sys/addAccount.jsp") })
	public String add2Account() {
		return "add2";
	}

	@Action(value = "add2AccountSave1", results = { @Result(name = "add2", location = "/WEB-INF/jsp/sys/addAccountSave1.jsp") })
	public String add2AccountSave1() {
		return "add2";
	}

	@Action(value = "add2AccountSave2", results = { @Result(name = "add2", location = "/WEB-INF/jsp/sys/addAccountSave2.jsp") })
	public String add2AccountSave2() {
		Account temp = service.getAccountBySid(bean.getSid());
		if (temp == null) {
			MessageUtil.addMessage(getRequest(), "银行卡号不存在");
			return ERROR;
		}
		putRequestValue("modifybean", temp);
		return "add2";
	}

	@Action(value = "showBalance1", results = { @Result(name = "add2", location = "/WEB-INF/jsp/sys/showBalance1.jsp") })
	public String showBalance1() {
		return "add2";
	}

	@Action(value = "showBalance2", results = { @Result(name = "add2", location = "/WEB-INF/jsp/sys/showBalance2.jsp") })
	public String showBalance2() {
		Account temp = service.getAccountBySid(bean.getSid());
		if (temp == null) {
			MessageUtil.addMessage(getRequest(), "银行卡号不存在");
			return ERROR;
		}
		if (!temp.getPassword().equals(bean.getPassword())) {
			MessageUtil.addMessage(getRequest(), "密码错误");
			return ERROR;
		}
		
		//start 利息
		String accountType = temp.getAccountType();
		double typeRate = 0.5/10000;//定期利息
		if (accountType.equals("活期")) {
			typeRate = 0.3/10000;
		}
		
		
		double allMoney = temp.getBalance() + temp.getInterest();
		String opendate = temp.getOpenDate();
		String currentDate = DateUtil.getInstance().getCurrentTime();
		long days = DateUtil.getInstance().expiryDays(opendate, currentDate);
		
		//利息*(存款+现有利息)*天
		double interest = allMoney*typeRate*days;		
		temp.setInterest(interest);
		service.update(temp);
		//end 利息
		temp.setDef01(String.valueOf(allMoney));
		putRequestValue("modifybean", temp);
		return "add2";
	}

	@Action(value = "add2AccountWithdraw1", results = { @Result(name = "add2", location = "/WEB-INF/jsp/sys/addAccountWithdraw1.jsp") })
	public String add2AccountWithdraw1() {
		return "add2";
	}

	@Action(value = "add2AccountTransfe", results = { @Result(name = "add2", location = "/WEB-INF/jsp/sys/addAccountTransfe.jsp") })
	public String add2AccountTransfe() {
		return "add2";
	}

	@Action(value = "add2AccountCancel", results = { @Result(name = "add2", location = "/WEB-INF/jsp/sys/cancelAccount.jsp") })
	public String add2AccountCancel() {
		return "add2";
	}

	@Action(value = "add2Password1", results = { @Result(name = "add2", location = "/WEB-INF/jsp/sys/modifyPassword1.jsp") })
	public String add2Password1() {
		return "add2";
	}

	@Action(value = "add2Password2", results = { @Result(name = "add2", location = "/WEB-INF/jsp/sys/modifyPassword2.jsp") })
	public String add2Password2() {
		Account temp = service.getAccountBySid(bean.getSid());
		if (temp == null) {
			MessageUtil.addMessage(getRequest(), "银行卡号不存在");
			return ERROR;
		}
		if (!temp.getPassword().equals(bean.getPassword())) {
			MessageUtil.addMessage(getRequest(), "旧密码错误");
			return ERROR;
		}
		if (!"正常".equals(temp.getStatus())) {
			MessageUtil.addMessage(getRequest(), "银行卡已经 " + temp.getStatus());
			return ERROR;
		}
		putRequestValue("modifybean", temp);
		return "add2";
	}

	@Action(value = "updateAccountPassword")
	public String updateAccountPassword() {
		try {
			Account temp = (Account) service.get(Account.class, bean.getId());
			temp.setPassword(bean.getPassword());
			service.update(temp);
			MessageUtil.addRelMessage(getHttpServletRequest(), "修改密码成功.",
					"baseAdd");
			return SUCCESS;
		} catch (Exception e) {
			MessageUtil.addMessage(getRequest(), "修改密码." + e.getMessage());
			return ERROR;
		}
	}

	@Action(value = "updateAccountTransfe")
	public String updateAccountTransfe() {
		try {
			if (bean.getSid().equals(ids)) {
				MessageUtil.addMessage(getRequest(), "被转账账户不可与转账账户一致");
				return ERROR;
			}
			service.updateAccountTransfe(bean, ids);
			MessageUtil.addRelMessage(getHttpServletRequest(), "转账成功.",
					"baseAdd");
			return SUCCESS;
		} catch (Exception e) {
			MessageUtil.addMessage(getRequest(), "转账失败." + e.getMessage());
			return ERROR;
		}
	}

	@Action(value = "updateAccountCancel")
	public String updateAccountCancel() {
		try {
			service.updateAccountCancel(bean);
			MessageUtil.addRelMessage(getHttpServletRequest(), "销户成功.",
					"baseAdd");
			return SUCCESS;
		} catch (Exception e) {
			MessageUtil.addMessage(getRequest(), "销户失败." + e.getMessage());
			return ERROR;
		}
	}

	@Action(value = "updateAccountSave")
	public String updateAccountSave() {
		try {
			service.updateAccountSave(bean);
			MessageUtil.addRelMessage(getHttpServletRequest(), "存款成功.",
					"baseAdd");
			return SUCCESS;
		} catch (Exception e) {
			MessageUtil.addMessage(getRequest(), "存款失败: " + e.getMessage());
			return ERROR;
		}
	}

	@Action(value = "updateAccountWithdraw")
	public String updateAccountWithdraw() {
		try {
			service.updateAccountWithdraw(bean);
			MessageUtil.addRelMessage(getHttpServletRequest(), "取款成功.",
					"baseAdd");
			return SUCCESS;
		} catch (Exception e) {
			MessageUtil.addMessage(getRequest(), "取款失败." + e.getMessage());
			return ERROR;
		}
	}

	/**
	 * 获取银行账户信息
	 * 
	 * @return
	 */
	@Action(value = "getAccount", results = { @Result(name = "getOne", location = "/WEB-INF/jsp/sys/showAccount.jsp") })
	public String get() {
		try {
			Account temp = (Account) service.get(Account.class, uid);
			putRequestValue("modifybean", temp);
			return "getOne";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	@Action(value = "deleteAccount")
	public String delete() {
		try {
			service.delete(Account.class, ids);
			MessageUtil.addRelMessage(getHttpServletRequest(), "删除信息成功.",
					"mainquery");
			return SUCCESS;
		} catch (Exception e) {
			MessageUtil.addMessage(getRequest(), "删除失败");
			return ERROR;
		}
	}

	@Action(value = "updateAccount")
	public String update() {
		try {
			// service.updateAccount(bean);
			MessageUtil.addMessage(getHttpServletRequest(), "更新成功.");
			return SUCCESS;
		} catch (Exception e) {
			MessageUtil.addMessage(getRequest(), "更新失败");
			return ERROR;
		}
	}

	@Action(value = "addAccount")
	public String add() {
		try {
			//start 校验idcard是否存在系统，两次用户信息需要一致。即判断姓名和性别即可
			Account account = service.getAAccountByIdCard(bean.getIdcard());
			if (null != account) {
				String realname = account.getRealname();
				Integer gender = account.getGender();
				if (bean.getGender() != gender || !bean.getRealname().equals(realname) ) {
					MessageUtil.addMessage(getRequest(), "客户信息与该身份证已存在客户信息不符！");
					return ERROR;
				}
			}
			//end 校验
			Account a = service.addAccount(bean);
			MessageUtil.addRelMessage(getHttpServletRequest(),
					"开卡成功.卡号: " + a.getSid(), "baseAdd");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(getRequest(), "添加失败");
			return ERROR;
		}
	}

	/**
	 * 贷款账户查询
	 * 
	 * @return
	 */
	@Action(value = "queryAccount", results = { @Result(name = "queryList", location = "/WEB-INF/jsp/sys/listAccount.jsp") })
	public String query() {
		try {
			int pageNum = 0;
			String t = getHttpServletRequest().getParameter("pageNum");
			if (StringUtil.notEmpty(t)) {
				pageNum = Integer.valueOf(t);
			}
			Page p = (Page) getHttpSession()
					.getAttribute(Constant.SESSION_PAGE);
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
						String fieldValue = getHttpServletRequest()
								.getParameter(name);// 页面字段值
						if (StringUtil.notEmpty(fieldValue)) {
							name = name.substring(2, name.length());// 实体字段名称
							parmnames.add(name);
							parmvalues.add(FieldUtil.format(Account.class,
									name, fieldValue));
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
			page = service.find(p, Account.class);

			getHttpSession().setAttribute(Constant.SESSION_PAGE, page);
			return "queryList";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	/**
	 * 银行账户信息查询
	 * 
	 * @return
	 */
	@Action(value = "queryBankAccount", results = { @Result(name = "queryList", location = "/WEB-INF/jsp/sys/listAccountForSysUser.jsp") })
	public String queryBank() {
		try {
			// add by zyn
			// 分页相关
			int pageNum = 0;
			String t = getHttpServletRequest().getParameter("pageNum");
			if (StringUtil.notEmpty(t)) {
				pageNum = Integer.valueOf(t);
			}
			// Page对象,是否存在查询条件
			Page p = (Page) getHttpSession()
					.getAttribute(Constant.SESSION_PAGE);
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
						String fieldValue = getHttpServletRequest()
								.getParameter(name);// 页面字段值
						if (StringUtil.notEmpty(fieldValue)) {
							name = name.substring(2, name.length());// 实体字段名称
							if (name.startsWith("account")) {
								name = name.substring(8, name.length());
							}
							parmnames.add(name);
							parmvalues.add(FieldUtil.format(Account.class,
									name, fieldValue));// 模糊查询
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
			// 接口通过类及page对象查找结果集合
			Page page = null;
			page = service.find(p, Account.class);

			getHttpSession().setAttribute(Constant.SESSION_PAGE, page);
			return "queryList";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public Account getModel() {
		return bean;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public Loan getLoan() {
		return loan;
	}

	public void setLoan(Loan loan) {
		this.loan = loan;
	}

}
