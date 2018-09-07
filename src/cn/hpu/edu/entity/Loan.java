package cn.hpu.edu.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * @author niaonao 
 * 贷款信息表
 */
@Entity
@Table(name = "t_loan")
public class Loan {
	private int id;
	private Account account;
	private double money;
	private String addDate;//借款日期
	private int month;//分期
	private String startPayDate;//开始还款日期
	private double perPayMoney;//每次还款
	private double rate;
	private double overdueinterest;//逾期利息：剩余未还金额*利率*时间(月)
	public double getOverdueinterest() {
		return overdueinterest;
	}

	public void setOverdueinterest(double overdueinterest) {
		this.overdueinterest = overdueinterest;
	}

	private String repaystatus;//还款状态:待还款/还款中/已还款/逾期还款
	private int repaymonth;//已还期数
	

	//根据贷款额度，贷款期数，及利率可计算总还款金额
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
	//根据已还期数，每期还款金额可计算出已还款金额，及待还款金额
	
	//还款功能L:提交期数即可。不可大于可还款期数
	//根据还款期数计算还款金额，(这都是可以算出来的变更待还款金额和已还款金额)

	public String getRepaystatus() {
		return repaystatus;
	}

	public void setRepaystatus(String repaystatus) {
		this.repaystatus = repaystatus;
	}

	public int getRepaymonth() {
		return repaymonth;
	}

	public void setRepaymonth(int repaymonth) {
		this.repaymonth = repaymonth;
	}

	@Transient
	public String getMoneyString(){
		return String.valueOf(money);
	}
	
	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
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

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "account_id")
	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public String getAddDate() {
		return addDate;
	}

	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	/**
	 * 还款日期
	 * @return
	 */
	public String getStartPayDate() {
		return startPayDate;
	}

	/**
	 * 还款日期
	 * @param startPayDate
	 */
	public void setStartPayDate(String startPayDate) {
		this.startPayDate = startPayDate;
	}

	public double getPerPayMoney() {
		return perPayMoney;
	}

	public void setPerPayMoney(double perPayMoney) {
		this.perPayMoney = perPayMoney;
	}

}
