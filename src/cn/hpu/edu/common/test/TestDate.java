package cn.hpu.edu.common.test;

import java.text.ParseException;

import cn.hpu.edu.common.util.DateUtil;

/**
 * 测试日期类
 * @author niaonao
 *
 */
public class TestDate {
	@SuppressWarnings("static-access")
	public static void main(String[] args) throws ParseException {
		String birth = "2017-01-01";
		String birth1 = "1987-04-03";
		String birth2 = "2001-05-30";
		String birth3 = "1989-01";
		
		DateUtil dateUtil = DateUtil.getInstance();
		System.out.println(dateUtil.isAdult(birth));
		System.out.println(dateUtil.isAdult(birth1));
		System.out.println(dateUtil.isAdult(birth2));
		System.out.println(dateUtil.isAdult(birth3));
	     
	     long days = dateUtil.expiryDays(birth1, birth2);
		System.out.println(days);
	}
	

}
