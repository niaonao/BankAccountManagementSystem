package cn.hpu.edu.web.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import cn.hpu.edu.common.dao.hibernate.BaseHibernateDao;
import cn.hpu.edu.entity.Account;
import cn.hpu.edu.entity.user.User;
import cn.hpu.edu.web.dao.ISysDao;

/**
 * 系统用户dao 的实现类
 * @author niaonao
 *
 */
@Repository
public class SysDaoImpl extends BaseHibernateDao implements ISysDao {
	public void saveUser(User user) {
		save(user);
	}

	public Object queryUser(String type, String userid, String pwd) {
		return unique("from " + type + " where user.uname='" + userid + "' and user.userPassword='" + pwd + "'");
	}

	public User queryUser(String userid) {
		return unique("from User where userid=?", userid);
	}
	
	public User queryUser(String userName,Integer userGender,String userPhone, String userEmail,String userBirth,String userAddress) {
		return unique("from User where userName=? and userGender=? and userPhone=? and userEmail=? and userAddress=? and userBirth=?", userName,userGender,userPhone,userEmail,userAddress,userBirth);
	}
	
	public User queryUserByUname(String uname) {
		return unique("from User where uname=?", uname);
	}
	
	public Account getAAccountByIdcard(String idCard) {
		return unique("from Account where idcard=?", idCard);
	}
	
	@SuppressWarnings("rawtypes")
	public List queryByHQLLimit(final String hql, final int start, final int max) {

		try {

			List resultList = getHibernateTemplate().executeFind(

			new HibernateCallback() {

				public Object doInHibernate(Session arg0)

				throws HibernateException, SQLException {

					Query query = arg0.createQuery(hql);

					query.setFirstResult(start);

					query.setMaxResults(max);

					return query.list();

				}

			});

			return resultList;

		} catch (RuntimeException re) {

			throw re;

		}

	}

}
