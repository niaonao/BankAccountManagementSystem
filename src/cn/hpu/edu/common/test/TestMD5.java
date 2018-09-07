package cn.hpu.edu.common.test;

import cn.hpu.edu.common.util.MD5;

/**
 * 测试MD5 加密类
 * @author niaonao
 */
public class TestMD5 {

	public static void main(String[] args) {
		String password = "123456";
		MD5 md = new MD5();
		password = md.getMD5ofStr(password);
		System.out.println(password);
	}
}
