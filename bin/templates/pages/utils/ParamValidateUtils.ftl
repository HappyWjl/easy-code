package ${package}.utils;

import java.util.List;

 /** 
 * <p>Description: [参数验证是否为空工具类]</p>
 * Created on ${date}
 * @author  <a href="mailto: ${email}">${author}</a>
 * @version 1.0 
 * Copyright (c)  ${website}
 */
public class ParamValidateUtils {

	/**
	 * 判断字符串是否为空
	 * @param value
	 * @return
	 */
	public static Boolean isEmpty(String value) {
		if (value == null || value.trim().length() == 0) {
			return true;
		}
		return false;
	}

	/**
	 * 判断是否为空
	 * @param obj
	 * @return
	 */
	public static Boolean isEmpty(Object obj) {
		if (null == obj || "".equals(obj)) {
			return true;
		}
		return false;
	}

	/**
	 * 判断list是否为空
	 * @param list
	 * @return
	 */
	public static Boolean listIsNull(List list) {
		
		if (list == null || list.size() == 0) {
			return true;
		}
		return false;
	}
	
	/**
	 * Discription:[判断Long数据是否为空]
	 * @param value
	 * @return
	 */
	public static Boolean isNull(Long longValue) {
		if (null == longValue || longValue == 0) {
			return true;
		}
		return false;
	}

	/**
	 * Discription:[判断Int数据是否为空]
	 * @param value
	 * @return
	 */
	public static Boolean isNull(Integer intValue) {
		if (null == intValue || intValue == 0) {
			return true;
		}
		return false;
	}
	
	/**
	 * Discription:[判断Int数据是否为空 0不属于空]
	 * @param intValue
	 * @return
	 */
	public static Boolean isNullNotContainZero(Integer intValue) {
		if (null == intValue) {
			return true;
		}
		return false;
	}

	public static void main(String[] args) {
		String a = "2019-04a-sss";
		System.out.println(a.lastIndexOf("-"));
		System.out.println(a.indexOf("-"));
		System.out.println(a.substring(7, a.lastIndexOf("-")));
		System.out.println(a.substring(a.lastIndexOf("-") + 1));
	}

}
