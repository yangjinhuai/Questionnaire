package com.fengyukeji.questionnaire.utils;

//懒汉式单例设计模式
public class PromptText {
	 private  PromptText(){}                     //构造函数
	 private static String Text=null;            //保存提示文字的静态变量
	 private static PromptText promptText=null;  //实例本类实例变量
	 
     public static PromptText getInstance(){     //获取本类实例
          if(promptText == null){
              promptText=new PromptText();
          }
          return promptText;
     }
     public  String getPromptText() {            //获取提示文字
		return Text; 
     }
     public  void setPromptText(String text) {   //设置提示文字
 		this.Text=text; 
      }
}
