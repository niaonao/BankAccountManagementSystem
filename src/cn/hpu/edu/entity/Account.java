package cn.hpu.edu.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author niaonao
 * 客户账户表
 */
@Entity
@Table(name = "t_account")
public class Account {
	private int id;
	private String sid;//卡号
	private String password;
	private String idcard;

	private String accountType;//定期,活期
	private String status;//正常, 冻结,  销户
	private String useType;//贷款

	private double balance;
	private double interest;

	private String realname;
	private String phone;
	private Integer gender;
	
	private Integer overduerepay;//曾经逾期还款，0否，1是；和贷款额度有关
	private String openDate;//开户日期
	
	public String getOpenDate() {
		return openDate;
	}

	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}

	private String def01;
	private String def02;
	private String def03;
	private String def04;
	private String def05;
	
	
	public String getDef01() {
		return def01;
	}
	
	public void setDef01(String def01) {
		this.def01 = def01;
	}
	
	public String getDef02() {
		return def02;
	}
	
	public void setDef02(String def02) {
		this.def02 = def02;
	}
	
	public String getDef03() {
		return def03;
	}
	
	public void setDef03(String def03) {
		this.def03 = def03;
	}
	
	public String getDef04() {
		return def04;
	}
	
	public void setDef04(String def04) {
		this.def04 = def04;
	}
	
	public String getDef05() {
		return def05;
	}
	
	public void setDef05(String def05) {
		this.def05 = def05;
	}
	public Integer getOverduerepay() {
		return overduerepay;
	}

	public void setOverduerepay(Integer overduerepay) {
		this.overduerepay = overduerepay;
	}

	public String getUseType() {
		return useType;
	}

	public void setUseType(String useType) {
		this.useType = useType;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(unique = true)
	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public double getInterest() {
		return interest;
	}

	public void setInterest(double interest) {
		this.interest = interest;
	}

	@Column(name = "gender", nullable = false, length = 11)
	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}
}
