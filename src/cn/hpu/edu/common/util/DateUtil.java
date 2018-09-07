package cn.hpu.edu.common.util;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 获取系统时间
 * add by niaonao 
 * @version 1.0 2007-11-30
 * @date 2018-5-29
 */
public class DateUtil {
	/* 日志对象 */
	// private static Logger logger = Logger.getLogger(SystemUtil.class);
	/* 获取年份 */
	public static final int YEAR = 1;
	/* 获取年月 */
	public static final int YEARMONTH = 2;
	/* 获取年月日 */
	public static final int YEARMONTHDAY = 3;
	/* 获取年月日，小时 */
	public static final int YMD_HOUR = 4;
	/* 获取年月日，小时，分钟 */
	public static final int YMD_HOURMINUTE = 5;
	/* 获取年月日，时分秒 */
	public static final int FULL = 6;
	/* 获取年月日时分秒 格式：yyyyMMddHHmmss */
	public static final int UTILTIME = 7;
	
	private DateUtil() {
	}
	
	private static DateUtil dateUtil = null;  
	
	public static DateUtil getInstance() {  
        if (null == dateUtil)  
        	dateUtil = new DateUtil();  
        return dateUtil;  
    }  
	
	public Date addDays(Date date, int days) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.DAY_OF_MONTH, calendar.get(Calendar.DAY_OF_MONTH) + days);
		return calendar.getTime();
	}

	/**
	 * 根据指定时间格式类型得到当前时间
	 * 
	 * @param type
	 *            时间类型
	 * @return String 字符串时间
	 */
	public synchronized String getCurrentTime(int type) {
		String format = getFormat(type);
		SimpleDateFormat timeformat = new SimpleDateFormat(format);
		Date date = new Date();
		return timeformat.format(date);
	}

	/**
	 * 返回当前系统时间的年月日
	 * 
	 * @return
	 */
	public synchronized String getCurrentTime() {
		SimpleDateFormat timeformat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		return timeformat.format(date);
	}

	/**
	 * 根据参数格式，格式化当前日期
	 * 
	 * @param format
	 * @return
	 */
	public synchronized String getDateString(String format) {
		SimpleDateFormat timeformat = new SimpleDateFormat(format);
		Date date = new Date();
		return timeformat.format(date);
	}

	/**
	 * 根据指定时间格式类型，格式化时间格式
	 * 
	 * @param type
	 *            时间格式类型
	 * @return
	 */
	private String getFormat(int type) {
		String format = "";
		if (type == 1) {
			format = "yyyy";
		} else if (type == 2) {
			format = "yyyy-MM";
		} else if (type == 3) {
			format = "yyyy-MM-dd";
		} else if (type == 4) {
			format = "yyyy-MM-dd HH";
		} else if (type == 5) {
			format = "yyyy-MM-dd HH:mm";
		} else if (type == 6) {
			format = "yyyy-MM-dd HH:mm:ss";
		} else if (type == 7) {
			format = "yyyyMMddHHmmss";
		} else {
			throw new RuntimeException("日期格式参数错误");
		}
		return format;
	}

	public int getYear(String dateString) {
		SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = dd.parse(dateString);
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			return cal.get(Calendar.YEAR);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public int getMonth(String dateString) {
		SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = dd.parse(dateString);
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			return cal.get(Calendar.MONTH) + 1;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public int getDay(String dateString) {
		SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = dd.parse(dateString);
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			return cal.get(Calendar.DAY_OF_MONTH);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public Date StringToDate(String dateStr, String formatStr) {
		SimpleDateFormat dd = new SimpleDateFormat(formatStr);
		Date date = null;
		try {
			date = dd.parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	/**
	 * 当前日期和参数日期距离的小时数 日期格式：yyyy-MM-dd HH:mm:ss
	 * 
	 * @param date
	 * @return
	 */
	public double getHours(String date) {
		SimpleDateFormat timeformat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		try {
			Date d = new Date();
			Date d1 = timeformat.parse(date);

			long temp = d.getTime() - d1.getTime();
			double f = temp / 3600000d;
			BigDecimal b = new BigDecimal(f);
			double f1 = b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			return f1;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	public int getAge(String birthDayString)  {
		SimpleDateFormat timeformat = new SimpleDateFormat("yyyy-MM-dd");
		Date birthDay = null;
		try {
			birthDay = timeformat.parse(birthDayString);
		} catch (ParseException e) {
			return 0;
		}
		Calendar cal = Calendar.getInstance();

		if (cal.before(birthDay)) {
			return 0;
		}

		int yearNow = cal.get(Calendar.YEAR);
		int monthNow = cal.get(Calendar.MONTH) + 1;
		int dayOfMonthNow = cal.get(Calendar.DAY_OF_MONTH);
		cal.setTime(birthDay);

		int yearBirth = cal.get(Calendar.YEAR);
		int monthBirth = cal.get(Calendar.MONTH);
		int dayOfMonthBirth = cal.get(Calendar.DAY_OF_MONTH);

		int age = yearNow - yearBirth;

		if (monthNow <= monthBirth) {
			if (monthNow == monthBirth) {
				// monthNow==monthBirth
				if (dayOfMonthNow < dayOfMonthBirth) {
					age--;
				} else {
				}
			} else {
				// monthNow>monthBirth
				age--;
			}
		} else {
			// monthNow<monthBirth
			// donothing
		}

		return age;
	}

	/**
	 * 是否满18岁
	 * @param birth
	 * @return
	 */
	public static boolean isAdult(String birth){
		DateUtil dateUtil = DateUtil.getInstance();
		//获取系统当前日期
		String currentTime = dateUtil.getCurrentTime();
		int currentyear = dateUtil.getYear(currentTime);
		int currentmonth = dateUtil.getMonth(currentTime);
		int currentday = dateUtil.getDay(currentTime);
		
		//分析用户提交日期
		if (birth.length() == 7) {
			birth = birth + "-01";
		}else if (birth.length() == 4) {
			birth = birth + "-01-01";
		}
		int year = dateUtil.getYear(birth);
		int month = dateUtil.getMonth(birth);
		int day = dateUtil.getDay(birth);
		int ageyear = currentyear - year;
		int agemonth = currentmonth - month;
		int ageday = currentday- day;
		if (ageyear > 17) {//年级达到18
			return true;
		}else if (ageyear == 17 ) {//ageyear等于17但是判断生日达到18
		
			if (agemonth > 0) {//月份够大无需判断天数
				return true;
			}else if(agemonth == 0 && (ageday > 0 ||ageday == 0)){//判断天数
				return true;
			}
			
		}
		
		return false;
	}
	
	
	/**
	 * 是否超出65岁，退休年龄
	 * @param birth
	 * @return
	 */
	public static boolean isOldness(String birth){
		DateUtil dateUtil = DateUtil.getInstance();
		//获取系统当前日期
		String currentTime = dateUtil.getCurrentTime();
		int currentyear = dateUtil.getYear(currentTime);
		int currentmonth = dateUtil.getMonth(currentTime);
		int currentday = dateUtil.getDay(currentTime);
		
		//分析用户提交日期
		if (birth.length() == 7) {
			birth = birth + "-01";
		}else if (birth.length() == 4) {
			birth = birth + "-01-01";
		}
		int year = dateUtil.getYear(birth);
		int month = dateUtil.getMonth(birth);
		int day = dateUtil.getDay(birth);
		int ageyear = currentyear - year;
		int agemonth = currentmonth - month;
		int ageday = currentday- day;
		if (ageyear > 65) {//年级达到65
			return true;
		}else if (ageyear == 64 ) {//ageyear等于64根据生日判断是否达到65
		
			if (agemonth > 0) {//月份够大无需判断天数
				return true;
			}else if(agemonth == 0 && (ageday > 0 ||ageday == 0)){//判断天数
				return true;
			}
			
		}
		
		return false;
	}
	
	/**
	 * 计算两个日期的差值
	 * @param endDate
	 * @param currentDate
	 * @return
	 */
	public long expiryDays(String endDate,String currentDate){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	     format.setLenient(false);
	     Date date1,date2;
	     long days = 0;
		try {
			date1 = format.parse(endDate);
			date2 = format.parse( currentDate);
			days=(date2.getTime()-date1.getTime())/(1000*60*60*24);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	     //计算差值，天数
	     return days;
	}
}
