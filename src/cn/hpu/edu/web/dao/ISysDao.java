package cn.hpu.edu.web.dao;

import java.util.List;

import cn.hpu.edu.common.dao.hibernate.BaseDao;
import cn.hpu.edu.entity.Account;
import cn.hpu.edu.entity.user.User;

/**
 * 系统用户dao
 * @author niaonao
 *
 */
public interface ISysDao extends BaseDao{
	public void saveUser(User user);

	public Object queryUser(String type,String userid, String pwd) ;

	/**
	 * 根据账户ID获取用户对象
	 * @param userid
	 * @return
	 */
	public User queryUser(String userid) ;

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
	public User queryUser(String userName,Integer userGender,String userPhone, String userEmail,String userBirth,String userAddress);
	
	/**
	 * 根据账户名获取用户对象
	 * @param uname
	 * @return
	 */
	public User queryUserByUname(String uname) ;
	
	/**
	 * 查询idcard下的一个银行账户
	 * @param idCard
	 * @return
	 */
	public Account getAAccountByIdcard(String idCard) ;
	
	@SuppressWarnings("rawtypes")
	public List queryByHQLLimit(final String hql, final int start, final int max);

	public <T> T unique(final String hql, final Object... paramlist);
}
