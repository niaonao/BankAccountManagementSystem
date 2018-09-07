package cn.hpu.edu.entity.user;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author niaonao
 * 用户：包括管理员及柜员，通过表t_sysuser及t_simple_user区分
 * Java反射机制，获取类名getSimpleName()
 */
@Entity
@Table(name = "t_user")
public class User implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// Fields
	private Integer userId;
	private String uname;
	private String userName;
	private String userPassword;
	private Integer userGender;
	private String userPhone;
	private String userEmail;
	private String userAddress;
	private String userBirth;
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
	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String uname, String userName, String userPassword,
			Integer userGender) {
		this.uname = uname;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userGender = userGender;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "userID", unique = true, nullable = false)
	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Column(name = "uname",unique = true, nullable = false, length = 20)
	public String getUname() {
		return this.uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	@Column(name = "userName", nullable = false, length = 20)
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "userPassword", nullable = false, length = 150)
	public String getUserPassword() {
		return this.userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	@Column(name = "userGender", nullable = false)
	public Integer getUserGender() {
		return this.userGender;
	}

	public void setUserGender(Integer userGender) {
		this.userGender = userGender;
	}

	@Column(name = "userPhone")
	public String getUserPhone() {
		return this.userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	@Column(name = "userEmail", length = 50)
	public String getUserEmail() {
		return this.userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	@Column(name = "userAddress", length = 100)
	public String getUserAddress() {
		return this.userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	@Column(name = "userBirth", length = 10)
	public String getUserBirth() {
		return this.userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	 

}