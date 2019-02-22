package com.fengyukeji.questionnaire.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.print.attribute.standard.PagesPerMinute;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.weaver.ast.Var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fengyukeji.questionnaire.bean.Answer;
import com.fengyukeji.questionnaire.bean.Quetionnaire;
import com.fengyukeji.questionnaire.service.AnswerService;
import com.fengyukeji.questionnaire.service.DataService;
import com.fengyukeji.questionnaire.service.QuetionnaireService;
import com.fengyukeji.questionnaire.utils.FileUtil;
import com.fengyukeji.questionnaire.utils.Msg;
import com.fengyukeji.questionnaire.utils.PromptText;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 表单控制器 用于表单数据的读取和编辑
 * @author xt
 *
 * 2017年11月6日
 */
@RequestMapping("/Form")
@Controller
public class FormController {
	
	@Autowired
	QuetionnaireService quetionnaireService;
	
	@Autowired
	AnswerService answerService;
	
	@Autowired
	DataService dataService;
	/**
	 * 保存表单信息
	 * @param quetionnaire
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/saveForm")
	public Msg saveForm(Quetionnaire quetionnaire, HttpServletRequest request){
		
		quetionnaireService.saveForm(quetionnaire);
		
		return Msg.success();
	}
	
	/**
	 * 获取 所有的form 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getForm")
	public Msg getForm(@RequestParam(value="pn",defaultValue = "1")Integer pn,HttpSession session){
		PageHelper.startPage(pn, 6);
		List<Quetionnaire> qusList = quetionnaireService.getForms();
		PageInfo page = new PageInfo(qusList,4);
		
		//当前页和总页数保存到session待用
		session.setAttribute("CurrentPageFaBu", page.getPageNum());
		session.setAttribute("CurrentPage", page.getPageNum());
		session.setAttribute("TotalPages", page.getPages());
		return Msg.success().add("form", page);
	}
	
	/**
	 * 根据表单id  删除一条表单 releaseForm 并删除生成的html文件
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteForm")
	public Msg deleteForm(HttpServletRequest request){
		Integer id = Integer.parseInt(request.getParameter("id"));
		String path=request.getSession().getServletContext().getRealPath("/fabu")+"\\";
		quetionnaireService.deleteForm(id,path);
		
		return Msg.success();
	}
	
	/**
	 * 获取 所有的releaseForm 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getAllReleaseForm")
	public Msg getAllReleaseForm(@RequestParam(value="pn",defaultValue = "1")Integer pn){
		PageHelper.startPage(pn, 8);
		List<Quetionnaire> qusList = quetionnaireService.getReleaseForms();
		PageInfo page = new PageInfo(qusList,8);
		return Msg.success().add("form", page);
	}
	
	/**
	 * 表单提交
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/submitForm")
	public Msg submitForm(HttpServletRequest request){
//		String url = request.getHeader("Referer");
//		String xip = request.getHeader("Origin");
//		String ip = request.getHeader("x-forwarded-for"); 
		//判断是否是ajax请求
		String requestType = request.getHeader("X-Requested-With");  
//		System.out.println(url);
//		System.out.println(xip);
//		System.out.println(ip);
		if(!requestType.equalsIgnoreCase("XMLHttpRequest")){ 
			Msg msg = new Msg();
			msg.setCode(200);
			msg.setMsg("操作成功");
			return msg;  
		}
		Integer questionnaireId = Integer.parseInt(request.getParameter("questionnaireId"));
		Integer questionNum = Integer.parseInt(request.getParameter("questionNum"));
		List<Answer> answerList = new ArrayList();
		int userNum = dataService.UserNumAndSetUserNum();
		for(int i=0;i<questionNum;i++){
			String str = request.getParameter("a"+i);
			
			String strings[] = str.split("`");
			String ans="";
			if(strings.length==2){
				ans = strings[1];
			}
																				//过滤不合理的答案
			if(ans.equals("null")||ans.equals("undefined")||ans.equals("请选择")||ans.equals("请选择;null")){
				ans="";
			}
			Answer answer = new Answer(null,strings[0],ans,userNum,questionnaireId);
			answerList.add(answer);
		}
		answerService.insertAnswerBath(answerList);
		dataService.addSubmitor();
		
		
		//获取答题提交后的提示文字
		String text=PromptText.getInstance().getPromptText();
		if(text==null) {
			text=dataService.getTipMsg();
			PromptText.getInstance().setPromptText(text);
		}
		request.getServletContext().setAttribute("tip", text);
		//String url = request.getSession().getAttribute("address").toString();
		//request.getSession().setAttribute(url, null);
		return Msg.success();
	}
	
		/**
		 * 复制表单 
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/getOneForm")
		public Msg getOneForm(HttpServletRequest request,HttpSession session){
			Integer formId=Integer.parseInt(request.getParameter("formId"));
			//通过formId获取表单
			Quetionnaire quetionnaire = quetionnaireService.getOneForm(formId);
			
			//改变表单名称得到新的表单并保存
			quetionnaire.setName("[新]"+quetionnaire.getName());
			quetionnaire.setQuesNum(quetionnaire.getQuesNum());
			quetionnaire.setId(null);
			quetionnaire.setQuesStatu(0);		
			quetionnaireService.saveForm(quetionnaire);
			 
			String newFormId=quetionnaire.getId().toString();
			//新表单ID保存到session待用
			
			return Msg.success().add("newFormId", newFormId);
		}
		/**
		 * 根据表单id查找表单
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/getFormById")
		public Msg getFormById(HttpServletRequest request,HttpSession session){		
			Integer formId = Integer.parseInt(request.getParameter("formId"));
            String form=request.getParameter("form");
			if(form.equals("copyedit")){//请求来自复制弹出框的编辑表单
				 //由于是复制后编辑表单，保存后要显示表单的最后一页，因此当前页currentPage数要改为总页数
				 Integer currentPage=Integer.parseInt(session.getAttribute("TotalPages").toString())+1;
				 session.setAttribute("CurrentPage", currentPage);
			}	
			  
			   //获取表单内容
				Quetionnaire quetionnaire=quetionnaireService.getFormById(formId);
				String QuestionTitle=quetionnaire.getName();
				String FormNode=quetionnaire.getQuesHtml();
				String FormId=quetionnaire.getId().toString();
				String Comment=quetionnaire.getComment();
                int start=FormNode.indexOf("<!-- 描述编辑区域E -->")+16;
                int end=FormNode.indexOf("</form>");
                FormNode=FormNode.substring(start,end);//截取需要的内容
				
				session.setAttribute("FormId", FormId);
				session.setAttribute("FormNode", FormNode);
				session.setAttribute("QueNum", quetionnaire.getQuesNum());
				session.setAttribute("QueCount", quetionnaire.getQuesNum());
				session.setAttribute("QuestionTitle", QuestionTitle);
				session.setAttribute("Comment", Comment);				
			return Msg.success();
		}
		
		/**
		 *清除session
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/clearSession")
		public Msg clearSession(HttpServletRequest request,HttpSession session)
		{
			session.setAttribute("FormId", "");
			session.setAttribute("FormNode", "");
			session.setAttribute("QuestionTitle", "");
			session.setAttribute("newFormId","");
			session.setAttribute("Comment", "");
			return Msg.success();             
		}
		
		/**
		 * 根据表单id  修改表单
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/modefiyForm")
		public Msg modefiyForm(HttpServletRequest request,HttpSession session){
			Integer id = Integer.parseInt(request.getParameter("id"));
			
			Quetionnaire quetionnaire=new Quetionnaire();
			quetionnaire.setQuesHtml(request.getParameter("quesHtml"));
			quetionnaire.setName(request.getParameter("name"));
			quetionnaire.setQuesNum(Integer.parseInt(request.getParameter("quesNum")));
			quetionnaire.setComment(request.getParameter("comment"));
			quetionnaire.setQuesDate(request.getParameter("quesDate"));
			
			quetionnaireService.modefiyForm(id,quetionnaire);
			
			return Msg.success();
		}
		
		/**
		 * 根据表单id  修改发布过后的表单
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/publishModefiyForm")
		public Msg publishModefiyForm(HttpServletRequest request,HttpSession session){
			Integer id = Integer.parseInt(request.getParameter("id"));
			
			Quetionnaire quetionnaire=new Quetionnaire();
			quetionnaire.setQuesHtml(request.getParameter("quesHtml"));
			quetionnaire.setName(request.getParameter("name"));
			quetionnaire.setQuesNum(Integer.parseInt(request.getParameter("quesNum")));
			quetionnaire.setComment(request.getParameter("comment"));
			quetionnaire.setQuesDate(request.getParameter("quesDate"));
			
			quetionnaireService.modefiyFormPublish(id,quetionnaire);
			String fabuAddress = quetionnaireService.getQuestionnaireFabuAddress(id);
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
	                        "<div class='form_tilte'>"+request.getParameter("name")+"</div>"+
	                            "<div class='form_describ'>"+
	                               "<h5 id='questionnaireId' questionnaireId='"+id+"'>"+request.getParameter("name")+"</h5>"+
	                               "<span>"+request.getParameter("comment")+"</span>"+
	                          "</div>"+
	                        "<!-- 顶部E -->"+		                 
	                        "<!-- 内容B -->"+
	                        "<div class='col-md-9 leftcontent' >"+ 
	                        request.getParameter("quesHtml")+       
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
			FileUtil.createFile(path, fabuAddress, releaseHtml);//函数调用，生成HTML文件
			return Msg.success();
		}
		

}
