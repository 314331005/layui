package com.tgb.utils;

import java.util.LinkedHashMap;
import java.util.Map;

public class ReturnUtils {

	/**
	 * 后台成功处理，返回成功代码等信息
	 * @param message
	 * @return
	 */
	public static Map<String, String> success(String message) {
		Map<String, String> jsonMap = new LinkedHashMap<String, String>();
		jsonMap.put("statusCode", "200");
		jsonMap.put("message", message);
		return jsonMap;
	}
	/**
	 * 后台处理失败，返回错误代码等信息
	 * @param message
	 * @return
	 */
	public static Map<String, String> error(String message) {
		Map<String, String> jsonMap = new LinkedHashMap<String, String>();
		jsonMap.put("statusCode", "500");
		jsonMap.put("message", message);
		return jsonMap;
	}
	/**
	 * 后台成功处理，刷新pageid页面form,并关闭模态窗口
	 * @param message
	 * @param pageid 要刷新页面面板id
	 * @return
	 */
	public static Map<String, String> success(String message, String pageid) {
		Map<String, String> jsonMap = new LinkedHashMap<String, String>();
		jsonMap.put("statusCode", "200");
		jsonMap.put("pageid", pageid);
		jsonMap.put("message", message);
		return jsonMap;
	}
}
