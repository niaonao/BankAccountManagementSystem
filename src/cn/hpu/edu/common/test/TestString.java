package cn.hpu.edu.common.test;

/**
 * @author niaonao
 * @description 测试split 方法
 */
public class TestString {

	public static void main(String[] args) {
		String value = "1.2";
		String[] names = value.split("\\.");
		for (int i = 0; i < names.length; i++) {
			System.out.println(names[i]);
		}
	}
}
