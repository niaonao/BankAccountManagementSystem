package cn.hpu.edu.web.service.impl;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import cn.hpu.edu.common.service.BaseService;
import cn.hpu.edu.common.util.DateUtil;
import cn.hpu.edu.common.util.MD5;
import cn.hpu.edu.common.util.MathExtend;
import cn.hpu.edu.common.util.Page;
import cn.hpu.edu.common.util.StringUtil;
import cn.hpu.edu.entity.Account;
import cn.hpu.edu.entity.Loan;
import cn.hpu.edu.entity.user.SimpleUser;
import cn.hpu.edu.entity.user.SysUser;
import cn.hpu.edu.entity.user.User;
import cn.hpu.edu.web.dao.ISysDao;

/**
 * 业务层，调用持久层dao
 * @author niaonao
 */
@Service("bizService")
@Repository
public class BaseSysService extends BaseService {

	@Autowired
	private ISysDao dao;

	@SuppressWarnings("rawtypes")
	public List queryByHQL(String hql, Object... values) {
		return dao.queryByHQL(hql, values);
	}

	public void addSimpleUser(SimpleUser obj) {
		User user = obj.getUser();
		MD5 md = new MD5();
		user.setUserPassword(md.getMD5ofStr(user.getUserPassword()));
		dao.save(user);
		dao.save(obj);
	}

	public void updateSimpleUser(SimpleUser obj) {
		SimpleUser temp = (SimpleUser) dao.get(SimpleUser.class, obj.getId());
		User user = temp.getUser();
		user.setUserAddress(obj.getUser().getUserAddress());
		user.setUserBirth(obj.getUser().getUserBirth());
		user.setUserEmail(obj.getUser().getUserEmail());
		user.setUserGender(obj.getUser().getUserGender());
		user.setUserName(obj.getUser().getUserName());
		user.setUserPhone(obj.getUser().getUserPhone());
		if (StringUtils.isNotBlank(obj.getUser().getUserPassword())) {
			MD5 md = new MD5();
			user.setUserPassword(md.getMD5ofStr(obj.getUser().getUserPassword()));
		}
		dao.merge(user);
		obj.setUser(user);
		dao.merge(obj);

	}

	/**
	 * 添加对象
	 * 
	 * @param obj
	 */
	public void add(Object obj) {
		dao.save(obj);
	}

	/**
	 * 修改对象
	 * 
	 * @param obj
	 */
	public void update(Object obj) {
		dao.merge(obj);
	}

	/**
	 * 根据id获取对象
	 * 
	 * @param clazz
	 * @param id
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public Object get(Class clazz, Serializable id) {
		return dao.get(clazz, id);
	}

	public void deleteUser(String ids) {
		dao.deleteByIds(User.class, ids);
	}

	@SuppressWarnings("rawtypes")
	public void delete(Class clazz, String ids) {
		dao.deleteByIds(clazz, ids);
	}

	public Object findUser(String type, String userid, String pwd) {
		return dao.queryUser(type, userid, pwd);
	}

	/**
	 * 根据账户ID获取用户对象
	 * @param userid
	 * @return
	 */
	public User findUser(String userid) {
		return dao.queryUser(userid);
	}
	
	/**
	 * 获取idcard下的一个银行账户
	 * @param idCard
	 * @return
	 */
	public Account getAAccountByIdCard(String idCard) {
		return dao.getAAccountByIdcard(idCard);
	}
	
	/**检查基本信息完全一致的对象
	 * 姓名：性别：联系电话：邮箱：出生日期：联系地址：
	 * @param userName
	 * @param userGender
	 * @param userPhone
	 * @param userEmail
	 * @param userBirth
	 * @param userAddress
	 * @return
	 */
	public User findUser(String userName,Integer userGender,String userPhone, String userEmail,String userBirth,String userAddress) {
		return dao.queryUser(userName, userGender, userPhone,  userEmail, userBirth, userAddress);
	}
	/**
	 * 根据账户名获取用户对象
	 * @param uname
	 * @return
	 */
	public User findUserByUname(String uname) {
		return dao.queryUserByUname(uname);
	}

	public Page findUser(Page page) {
		return dao.list(page, "User");
	}

	@SuppressWarnings("rawtypes")
	public Page find(Page page, Class clazz) {
		return dao.list(page, clazz.getSimpleName());
	}

	@SuppressWarnings("rawtypes")
	public List findAll(Class clazz) {
		return dao.queryByHQL("from " + clazz.getSimpleName());
	}

	public void addSysUser(SysUser obj) {
		User user = obj.getUser();
		MD5 md = new MD5();
		user.setUserPassword(md.getMD5ofStr(user.getUserPassword()));
		dao.save(user);
		dao.save(obj);
	}

	public void updateSysUser(SysUser obj) {
		SysUser temp = (SysUser) dao.get(SysUser.class, obj.getId());
		User user = temp.getUser();
		user.setUserAddress(obj.getUser().getUserAddress());
		user.setUserBirth(obj.getUser().getUserBirth());
		user.setUserEmail(obj.getUser().getUserEmail());
		user.setUserGender(obj.getUser().getUserGender());
		user.setUserName(obj.getUser().getUserName());
		user.setUserPhone(obj.getUser().getUserPhone());
		if (StringUtils.isNotBlank(obj.getUser().getUserPassword())) {
			MD5 md = new MD5();
			user.setUserPassword(md.getMD5ofStr(obj.getUser().getUserPassword()));
		}
		dao.merge(user);
		obj.setUser(user);
		dao.merge(obj);

	}

	@SuppressWarnings("rawtypes")
	public List findAll(Class clazz, Map<String, Object> params) {
		return dao.findAll(clazz, params);
	}

	//add by niaonao 账户开户算法,与身份证及银行账户绑定
	//7用户开卡（分定期和活期存款）：用户提供身份证号，验证身份证号是否合法（判断位数即可），
	//系统自动生成卡号（尾数为奇数的是定期卡，尾数为偶数的是活期卡），
	//关联银行卡和身份证，提示开卡成功
	public Account addAccount(Account bean) {
		String sid = "9887";
		Random ran = new Random();
		//19-4-1 14位
		int i1 = ran.nextInt(100000);
		int i2 = ran.nextInt(100000);
		String s1 = StringUtil.format0String(7, i1);
		String s2 = StringUtil.format0String(7, i2);

		int last = 0;
		if ("定期".equals(bean.getAccountType())) {
			last = ran.nextInt(5) * 2 + 1;
		} else {
			last = ran.nextInt(5) * 2;
		}

		sid += (s1 + s2 + last);
		bean.setSid(sid);
		bean.setStatus("正常");
		bean.setUseType("否");//是否贷款账户
		bean.setOverduerepay(0);//未曾逾期还款

		dao.save(bean);

		return bean;
	}

	public Account getAccountBySid(String sid) {
		return dao.unique("from Account where sid=?", sid);
	}
	
	/**
	 * 获取账户列表
	 * @param idcard
	 * @return
	 */
	public List<Account> getAccountByIdcard(String idcard) {
		return dao.unique("from Account where idcard=?", idcard);
	}

	public void updateAccountSave(Account bean) {
		Account temp = (Account) dao.get(Account.class, bean.getId());
		if (temp == null) {
			throw new RuntimeException("银行卡号不存在");
		}
		if (!temp.getStatus().equals("正常")) {
			throw new RuntimeException("银行卡异常: " + temp.getStatus());
		}
		temp.setBalance(temp.getBalance() + bean.getBalance());
		dao.update(temp);
	}

	/**
	 * 取款
	 * @param bean
	 */
	public void updateAccountWithdraw(Account bean) {
		Account temp = dao.unique("from Account where sid=?", bean.getSid());
		if (temp == null) {
			throw new RuntimeException("银行卡号不存在");
		}
		if (!temp.getPassword().equals(bean.getPassword())) {
			throw new RuntimeException("密码错误");
		}
		if (!temp.getStatus().equals("正常")) {
			throw new RuntimeException("银行卡异常: " + temp.getStatus());
		}
		//计算存款利息
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
		if ((temp.getBalance()+temp.getInterest()) < bean.getBalance()) {
			throw new RuntimeException("余额不足");
		}

		temp.setBalance(temp.getBalance() - bean.getBalance());
		dao.update(temp);

	}

	public void updateAccountTransfe(Account bean, String ids) {
		Account temp = dao.unique("from Account where sid=?", bean.getSid());
		if (temp == null) {
			throw new RuntimeException("转出银行卡号不存在");
		}
		if (!temp.getPassword().equals(bean.getPassword())) {
			throw new RuntimeException("密码错误");
		}
		if (!temp.getStatus().equals("正常")) {
			throw new RuntimeException("转出银行卡异常: " + temp.getStatus());
		}
		if (temp.getBalance() < bean.getBalance()) {
			throw new RuntimeException("转出银行卡余额不足");
		}

		Account temp1 = dao.unique("from Account where sid=?", ids);
		if (temp1 == null) {
			throw new RuntimeException("转入银行卡号不存在");
		}
		if (!temp1.getStatus().equals("正常")) {
			throw new RuntimeException("转入银行卡异常: " + temp1.getStatus());
		}

		temp.setBalance(temp.getBalance() - bean.getBalance());
		dao.update(temp);
		temp1.setBalance(temp1.getBalance() + bean.getBalance());
		dao.update(temp1);

	}

	public void updateAccountCancel(Account bean) {
		Account temp = dao.unique("from Account where sid=?", bean.getSid());
		if (temp == null) {
			throw new RuntimeException("银行卡号不存在");
		}
		if (!temp.getPassword().equals(bean.getPassword())) {
			throw new RuntimeException("密码错误");
		}
		if (!temp.getStatus().equals("正常")) {
			throw new RuntimeException("银行卡异常: " + temp.getStatus());
		}
		if (temp.getUseType() != null && "贷款".equals(temp.getUseType())) {
			throw new RuntimeException("贷款银行卡不能销户");
		}

		temp.setStatus("销户");
		dao.update(temp);

	}

	@SuppressWarnings("rawtypes")
	public List findAllAccount(String idcard) {
		return dao.queryByHQL("from Account where idcard=?", idcard);
	}

	public void updateAccountUnlock(Account bean) {
		Account temp = dao.unique("from Account where sid=?", bean.getSid());
		if (temp == null) {
			throw new RuntimeException("银行卡号不存在");
		}
		if (!temp.getIdcard().equals(bean.getIdcard())) {
			throw new RuntimeException("身份证号码错误");
		}
		if (temp.getStatus().equals("正常")) {
			throw new RuntimeException("银行卡可以正常使用,不需要解锁 ");
		}
		if (!temp.getStatus().equals("冻结")) {
			throw new RuntimeException("银行卡不能解锁: " + temp.getStatus());
		}
		temp.setStatus("正常");
		dao.update(temp);

	}

	public void updateAccountForLoan(int uid) {
		Account temp = (Account) dao.get(Account.class, uid);
		if (temp == null) {
			throw new RuntimeException("银行卡号不存在");
		}
		if (!temp.getStatus().equals("正常")) {
			throw new RuntimeException("银行卡不能设置贷款账号: " + temp.getStatus());
		}
		if (temp.getUseType() != null && "贷款".equals(temp.getUseType())) {
			throw new RuntimeException("银行卡已经是贷款账号");
		}
		temp.setUseType("贷款");
		dao.update(temp);

	}

	/**
	 * 贷款业务办理
	 * 1.贷款额度验证
	 * 2.银行账户验证
	 * 3.贷款期限及还款日期设置
	 * 4.还款金额计算
	 * 5.添加loan贷款记录
	 * @param loan
	 * @return
	 * @throws Exception
	 */
	public Loan addLoan(Loan loan) throws Exception {
		double money = loan.getMoney();//贷款额度
		if (money == 0) {
			
			throw new RuntimeException("贷款额度不能低于0元");
		}
		if (money > 1000000) {
			throw new RuntimeException("单次贷款额度不超过100万人民币");
		}

		Account temp = dao.unique("from Account where sid=?", loan.getAccount().getSid());
		if (temp == null) {
			throw new RuntimeException("银行卡号不存在");
		}
		if (temp.getUseType() == null || !"贷款".equals(temp.getUseType())) {
			throw new RuntimeException("银行卡不是贷款账号");
		}
		if (temp.getOverduerepay() == 1 && money > 600000) {//贷款账户存在逾期还款记录
			throw new RuntimeException("单次贷款额度不超过60万人民币");
		}

		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = sf.parse(loan.getAddDate());
		//根据贷款额度进行设置还款期限
		if (money > 600000 ) {
			
			date1 = DateUtil.getInstance().addDays(date1, 90);
		}else if (money > 300000) {
			
			date1 = DateUtil.getInstance().addDays(date1, 60);
		}else {
			
			date1 = DateUtil.getInstance().addDays(date1, 30);
		}
		String date2 = sf.format(date1);

		double perPayMoney = getPerPay(money, loan.getRate() / 100, loan.getMonth());

		//贷款成功，更新账户余额
		double balance = temp.getBalance()+money;
		temp.setBalance(balance);
		dao.merge(temp);
		
		loan.setAccount(temp);
		loan.setStartPayDate(date2);//还款日期
		loan.setPerPayMoney(perPayMoney);
		loan.setOverdueinterest(0);//逾期利息
		loan.setRepaymonth(0);//已还款期数
		loan.setRepaystatus("待还款");

		dao.save(loan);
		

		return loan;
	}

	//每期应还款额＝【借款本金×利率×（1＋利率）^还款期数】/【（1＋利率）^还款期数－1】
	public static double getPerPay(double base, double rate, double month) {
		double temp = (base * rate * Math.pow((1 + rate), month)) / (Math.pow((1 + rate), month) - 1);
		return MathExtend.round(temp, 2);
	}

	@SuppressWarnings("unchecked")
	public List<Loan> findLoanList(String ids) {
		List<Loan> list = dao.queryByHQL("from Loan where account.sid='"+ids+"'");
		return list;
	}
	

}
