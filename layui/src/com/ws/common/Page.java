package com.ws.common;

import java.util.LinkedList;
import java.util.List;

/**
 * 分页工具类
 * @author 	ws
 * @date	2016-12-8
 */
public class Page<T>  {
	
	/**
	 * 当前页码
	 */
	private int pageNumber = 1;
	
	/**
	 * 每页数据量
	 */
	private int pageSize = 15;
	
	/**
	 * 数据总量
	 */
	private long totalCount = 1;
	private long offset = 1;
	//private long endNo = 1;
	/**
	 * 总页数
	 */
	//private long totalPages = 0;
	
	/**
	 * 当前页的数据列表
	 */
	private List<T> result = new LinkedList<T>();
	
	/**
	 * 获得当前页的页号,序号从1开始,默认为1.
	 */
	public int getPageNumber() {
		return pageNumber;
	}

	/**
	 * 设置当前页的页号,序号从1开始,低于1时自动调整为1.
	 */
	public void setPageNumber(final int pageNumber) {
		this.pageNumber = pageNumber;

		if (pageNumber < 1) {
			this.pageNumber = 1;
		}
	}
	
	/**
	 * 获得每页的记录数量,默认为1.
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * 设置每页的记录数量,低于1时自动调整为1.
	 */
	public void setPageSize(final int pageSize) {
		this.pageSize = pageSize;

		if (pageSize < 1) {
			this.pageSize = 1;
		}
	}
	
	/**
	 * 取得总记录数, 默认值为1.
	 */
	public long getTotalCount() {
		return totalCount;
	}

	/**
	 * 设置总记录数.
	 */
	public void setTotalCount(final long totalCount) {
		this.totalCount = totalCount;
	}
	
	/**
	 * 根据pageSize与totalCount计算总页数, 默认值为1.
	 */
	public long getTotalPages() {
		if (totalCount < 0) {
			return 1;
		}
		long count = totalCount / pageSize;
		if (totalCount % pageSize > 0) {
			count++;
		}
		return count;
	}

	public void setResult(List<T> result) {
		this.result = result;
	}
	
	public List<T> getResult() {
		return result;
	}

	public long getOffset() {
		return (pageNumber-1) * pageSize;
		//return startNo;
	}

	public void setOffset(long offset) {
		this.offset = offset;
	}

	


	
}
