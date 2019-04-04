package ${package}.utils;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

 /** 
 * <p>Description: [时间转换工具类]</p>
 * Created on ${date}
 * @author  <a href="mailto: ${email}">${author}</a>
 * @version 1.0 
 * Copyright (c) ${year} ${website}
 */
public class TimeFormatUtils {

	/**
	 * yyyy-MM-dd
	 * 
	 * @param time
	 * @return
	 */
	public static final String formatDate(Long time) {
		if (time == null) {
			return "";
		}
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df.format(time);
	}

	/**
	 * HH:mm:ss
	 * 
	 * @param time
	 * @return
	 */
	public static final String formatTime(Long time) {
		if (time == null) {
			return "";
		}
		DateFormat df = new SimpleDateFormat("HH:mm:ss");
		return df.format(time);
	}

	/**
	 * yyyy-MM-dd HH:mm:ss
	 * 
	 * @param time
	 * @return
	 */
	public static final String formatDateTime(Long time) {
		if (time == null) {
			return "";
		}
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(time);
	}

	/**
	 * yyyyMMddHHmmss
	 * 
	 * @param time
	 * @return
	 */
	public static final String formatDateTimeNoLine(Long time) {
		if (time == null) {
			return "";
		}
		DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		return df.format(time);
	}

	public static final Date formatStringToDate(String time) {
		if (time == null) {
			return null;
		}
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = null;
		try {
			date = dateFormat.parse(time);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}

	public static final Date formatStringToTime(String time) {
		if (time == null) {
			return null;
		}
		DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		;
		Date date = null;
		try {
			date = dateFormat.parse(time);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}

	public static final Date formatStringToTime(Long time) {
		if (time == null) {
			return null;
		}
		String tempTime = formatTime(time);
		DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		Date date = null;
		try {
			date = dateFormat.parse(tempTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}

	private static final DateFormat longDateFormat = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");
	private static final DateFormat shortDateFormat = new SimpleDateFormat(
			"yyyy-MM-dd");
	private static final DateFormat compactDateFormat = new SimpleDateFormat(
			"yyyyMMddHHmmss");
	private static final DateFormat millisecondDateFormat = new SimpleDateFormat(
			"yyyyMMddHHmmssSSS");
	private static final DateFormat simpleDateFormat = new SimpleDateFormat(
			"yyMM");
	/*private static final DateFormat dateFormat = new SimpleDateFormat(
			"yyyy-MM-dd");*/

	/**
	 * 返回当前日期，表现形式：yyyy-MM-dd HH:mm:ss
	 * 
	 * @return
	 */
	public static String formatLongDate() {
		return longDateFormat.format(new Date());
	}

	/**
	 * 返回当前日期，表现形式：yyyy-MM-dd
	 * 
	 * @return
	 */
	public static String formatShortDate() {
		return shortDateFormat.format(new Date());
	}

	/**
	 * 返回当前日期，表现形式：yyyyMMddHHmmss
	 * 
	 * @return
	 */
	public static String formatCompactDate() {
		return compactDateFormat.format(new Date());
	}

	/**
	 * 返回当前日期，表现形式：yyyyMMddHHmmssSSS
	 * 
	 * @return
	 */
	public static String formatMillisecondDate() {
		return millisecondDateFormat.format(new Date());
	}

	/**
	 * 返回当前日期，表现形式：yyyyMM
	 * 
	 * @return
	 */
	public static String formatSimpleDate() {
		return simpleDateFormat.format(new Date());
	}

	public static Timestamp getNowTimeStamp() {
		Date nowday = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(nowday);
		Timestamp ts;
		try {
			ts = new Timestamp(sdf.parse(time).getTime());
		} catch (ParseException e) {
			ts = null;
			e.printStackTrace();
		}
		return ts;
	}

	public static String getNowTime() {
		Date nowDay = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(nowDay);
		return time;
	}

}
