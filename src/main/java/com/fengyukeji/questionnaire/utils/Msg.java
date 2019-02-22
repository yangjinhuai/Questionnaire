package com.fengyukeji.questionnaire.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * 消息类
 * @author xt
 *
 * 2017年10月29日
 */
public class Msg {
  private int code;
  private String msg;
  private Map<String,Object> extend = new HashMap();
  /**
   * 返回成功的方法
   * @return
   */
  public static Msg success(){
	  Msg msg = new Msg();
	  msg.setCode(200);
	  msg.setMsg("处理完成");
	  return msg;
  }
  /**
   * 返回失败的方法
   * @return
   */
  public static Msg failed(){
	  Msg msg = new Msg();
	  msg.setCode(100);
	  msg.setMsg("处理失败");
	  return msg;
  }
  /**
   * 添加数据方法
   * @param key 数据的key
   * @param value 数据的值
   * 
   * @return
   */
  public Msg add(String key,Object value){
	this.getExtend().put(key, value);
	return this;
  }
  
  
public int getCode() {
	return code;
}
public void setCode(int code) {
	this.code = code;
}
public String getMsg() {
	return msg;
}
public void setMsg(String msg) {
	this.msg = msg;
}
public Map<String, Object> getExtend() {
	return extend;
}
public void setExtend(Map<String, Object> extend) {
	this.extend = extend;
}
  
}
