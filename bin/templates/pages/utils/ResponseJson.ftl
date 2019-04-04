package ${package}.utils;

import java.io.Serializable;
 /** 
 * <p>Description: [返回json模板]</p>
 * Created on ${date}
 * @author  <a href="mailto: ${email}">${author}</a>
 * @version 1.0 
 * Copyright (c) ${year} ${website}
 */
public class ResponseJson  implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer code;//返回码
	private String msg;//返回信息
	private Object data;//返回数据
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	public ResponseJson() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ResponseJson(Integer code, String msg, Object data) {
		super();
		this.code = code;
		this.msg = msg;
		this.data = data;
	}
	
	public ResponseJson(Integer code, Object data) {
		super();
		this.code = code;
		this.data = data;
	}
	
	public ResponseJson(Integer code) {
		super();
		this.code = code;
	}
	
}
