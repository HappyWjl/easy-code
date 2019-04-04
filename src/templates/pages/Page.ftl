package ${package}.model;

import java.io.Serializable;
/** 
 * <p>Description: [分页model]</p>
 * Created on ${date}
 * @author  <a href="mailto: ${email}">${author}</a>
 * @version 1.0 
 * Copyright (c) ${year} ${website}
 */
public class Page  implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer currentPage = 1;// 当前页
 
	private Integer pageSize = 10;// 每页量
 
	private String orderField;// 排序字段，多个字段用","隔开
 
	private String sort = "DESC";// 排序方式，DESC降序；ASC升序
 
	private Integer pageOffset;// 分页开始记录条数
 
	private Long totalRecord;// 总记录数
 
	private Integer totalPage;// 总页数

	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public String getOrderField() {
		return orderField;
	}
	public void setOrderField(String orderField) {
		this.orderField = orderField;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public Integer getPageOffset() {
		return pageOffset;
	}
	public void setPageOffset(Integer pageOffset) {
		this.pageOffset = pageOffset;
	}
	public Long getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(Long totalRecord) {
		this.totalRecord = totalRecord;
	}
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
}
