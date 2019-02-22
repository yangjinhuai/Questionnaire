package com.fengyukeji.questionnaire.controller;
//表单预览控制器

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fengyukeji.questionnaire.bean.Answer;
import com.fengyukeji.questionnaire.bean.Quetionnaire;
import com.fengyukeji.questionnaire.service.AnswerService;
import com.fengyukeji.questionnaire.service.QuetionnaireService;
import com.fengyukeji.questionnaire.utils.FileUtil;
import com.fengyukeji.questionnaire.utils.Msg;
import com.fengyukeji.questionnaire.utils.RadomUtil;

/**
 * 表单预览控制器
 * @author xt
 *
 * 2017年11月9日
 */
@RequestMapping("/FormPreview")
@Controller
public class FormPreviewController {
	@Autowired
	QuetionnaireService quetionnaireService;
	@Autowired
    AnswerService answerService;
	/**
	 *从获取表单，请求来自添加问卷页面
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getPreviewForm")
	public Msg getPreviewForm(HttpServletRequest request,HttpSession session)
	{
		String QuestionTitle=request.getParameter("questionTitle");
		String QuestionDescribe=request.getParameter("questionDescribe");
		String FormNode=request.getParameter("formNode");  
		
		session.setAttribute("FormNode", FormNode);
		session.setAttribute("QuestionTitle", QuestionTitle);
		session.setAttribute("QuestionDescribe", QuestionDescribe);
		
		return Msg.success();             
	}
	
	
	/**
	 *预览表单，请求来自编辑问卷页面getPreviewForm
	 * @return
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping("/getForm")
	public Msg getForm(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException
	{
		//请求来自编辑问卷页面
		Integer FormId=Integer.parseInt(request.getParameter("formId"));
		if(FormId!=null)
		{
			Quetionnaire quetionnaire=quetionnaireService.getFormById(FormId);
			String QuestionTitle=quetionnaire.getName();
			String QuestionDescribe=quetionnaire.getComment();
			String FormNode=quetionnaire.getQuesHtml();
			
			session.setAttribute("FormNode", FormNode);
			session.setAttribute("QuestionTitle", QuestionTitle);
			session.setAttribute("QuestionDescribe", QuestionDescribe);
			
		}
		return Msg.success();             
	}
	/**
	 *发布表单，请求来自编辑问卷页面releaseForm
	 * @return
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping("/ReleaseForm")
	public Msg getReleaseForm(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException
	{	
		//请求来自编辑问卷页面
		Integer FormId=Integer.parseInt(request.getParameter("formId"));
		if(FormId!=null)
		{
			Quetionnaire quetionnaire=quetionnaireService.getFormById(FormId);		
			String QuestionTitle=quetionnaire.getName();
			String QuestionDescribe=quetionnaire.getComment();
			String FormNode=quetionnaire.getQuesHtml();
			
			String path=request.getSession().getServletContext().getRealPath("/fabu")+"\\";
			String releaseHtml="<!DOCTYPE html>"+
		              "<html>"+
	                  "<head>"+
	                     "<meta charset='UTF-8'>"+
	                     "<meta name=\'viewport\' content=\'width=device-width, initial-scale=1, user-scalable=no\'>"+
	                     "<title>问卷调查-招生就业处问卷管理系统</title>"+
	                     "<link rel='stylesheet' type='text/css' href='static/css/common.css'>"+
	                     "<link rel='stylesheet' type='text/css' href='static/css/bootstrap.min.css'>"+
	                     "<link rel='stylesheet' type='text/css' href='static/css/font-awesome.min.css'>"+
	                     "<link rel='stylesheet' type='text/css' href='static/css/formPreview.css'>"+
	                     "<script type='text/javascript' src='static/js/checkIe.js'></script>"+
	                     "<script type='text/javascript' src='static/js/jquery.min.js'></script>"+
	                     "<script type='text/javascript' src='static/js/layer.js'></script>"+
	                     "<script type='text/javascript' src='static/js/form.js'></script>"+
	                  "</head>"+
	                  "<body>"+
	                     "<div class='mobileQhone' id='mbg'>"+
	       	                "<!-- 顶部B -->"+
	                        "<div class='form_tilte'>"+QuestionTitle+"</div>"+
	                            "<div class='form_describ'>"+
	                               "<h5 id='questionnaireId' questionnaireId='"+FormId+"'>"+QuestionTitle+"</h5>"+
	                               "<span>"+QuestionDescribe+"</span>"+
	                          "</div>"+
	                        "<!-- 顶部E -->"+		                 
	                        "<!-- 内容B -->"+
	                        "<div class='col-md-9 leftcontent' >"+ 
	                            FormNode+       
	       	                "</div>"+
	       	                "<!-- 内容E --> "+		       	    
	       	                "<!-- 底部B -->"+
	       	                "<div class='Bottom clear'>"+
	       	                   "<input class='submit' type='button' value='提交' style='color:white'>"+    
	       	                "</div>"+
	       	                "<!-- 底部E -->"+
	       	             "</div>"+
	                  "</body>"+
	                  "</html>";
			String fabuAddress = RadomUtil.getRaddom();
			FileUtil.createFile(path, fabuAddress, releaseHtml);//函数调用，生成HTML文件
			quetionnaireService.release(FormId,fabuAddress);
		}
		return Msg.success();             
	}
	/**
	 *从获取表单答案，请求来自数据分析页面
	 * @return
	 */
	/*
	@ResponseBody
	@RequestMapping("/getFormAnswer")
	public Msg getFormAnswer(HttpServletRequest request,HttpSession session)
	{
		  Integer formId=Integer.parseInt(request.getParameter("formId"));
		
		  
		//String QuestionTitle=request.getParameter("questionTitle");
		//String QuestionDescribe=request.getParameter("questionDescribe");
		//String FormNode=request.getParameter("formNode");  
		
		//session.setAttribute("FormNode", FormNode);
		//session.setAttribute("QuestionTitle", QuestionTitle);
		//session.setAttribute("QuestionDescribe", QuestionDescribe);
		
		return Msg.success();             
	}*/
	
}
