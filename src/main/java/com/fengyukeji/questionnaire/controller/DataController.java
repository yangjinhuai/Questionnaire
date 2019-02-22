package com.fengyukeji.questionnaire.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fengyukeji.questionnaire.bean.DataAnswer;
import com.fengyukeji.questionnaire.bean.QuestionAnswer;
import com.fengyukeji.questionnaire.bean.Quetionnaire;
import com.fengyukeji.questionnaire.service.ConfirmService;
import com.fengyukeji.questionnaire.service.DataService;
import com.fengyukeji.questionnaire.utils.Msg;
import com.fengyukeji.questionnaire.utils.PromptText;
import com.fengyukeji.questionnaire.utils.SimpleExcelWrite;
import com.github.pagehelper.PageInfo;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

/**
 * 数据控制器
 * @author xt
 *
 * 2017年11月16日
 */
@RequestMapping("/Data")
@Controller
public class DataController {
	
	@Autowired
	DataService dataService;
	
	@Autowired
	ConfirmService confirmService;
	
	PromptText promptext=PromptText.getInstance();
	/**
	 * 获取发布过的问卷以及收到的答案数
	 * @return
	 * @throws Exception 
	 */
	@ResponseBody
	@RequestMapping("/getRelesedAnswerNum")
	public Msg getRelesedAnswerNum() throws Exception{
		List<DataAnswer> dataAnswerList = dataService.getRelesedAnswerNum();
		PageInfo page = new PageInfo(dataAnswerList,8);
		return Msg.success().add("anwserNum", page);
	}
	
	/**
	 * 根据问卷id 获取问卷的题目和答案
	 * @return
	 * @throws IOException 
	 * @throws WriteException 
	 * @throws RowsExceededException 
	 */
	@ResponseBody
	@RequestMapping("/getQuestionAnswerById")
	public Msg getQuestionAnswerById(@RequestParam("id")Integer id,HttpSession session,HttpServletRequest request) throws IOException, RowsExceededException, WriteException{
		try{
			List<QuestionAnswer> questionAnswerList = dataService.getQuestionAnswerById(id);
			Quetionnaire  quetionnaire = dataService.getQuestion(id);
			int queNum = quetionnaire.getQuesNum();
			String address = quetionnaire.getFabuAddress();
			String queName = quetionnaire.getName();
			Integer colleStatu = quetionnaire.getColleStatu();
			String quesDate=quetionnaire.getQuesDate();
			int confirmType = quetionnaire.getConfirmType();
			session.setAttribute("quesDate", quesDate);
			
			String tipMsg=promptext.getPromptText();
			if(tipMsg==null) {
				tipMsg = dataService.getTipMsg();
				promptext.setPromptText(tipMsg);
			} 
			request.getServletContext().setAttribute("tip", tipMsg);	
			
			return Msg.success().add("questionAnwser", questionAnswerList).add("queNum", queNum).add("address", address).add("queName", queName).add("colleStatu", colleStatu).add("confirmType", confirmType).add("quesDate", quesDate).add("tipMsg", tipMsg);
		}catch(NullPointerException e){
			e.printStackTrace();
			return Msg.failed();
		}
	}
	
	/**
	 * 文件上传
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/uploadFile")
	public Msg uploadFile(MultipartFile file,HttpServletRequest request){
		if(null!=file&&!file.isEmpty()){
			//取得原文件名
			String fileName = file.getOriginalFilename();
			//获取文件后缀名
			String suffix = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
			if(!suffix.equals(".xls")){
				Msg msg = new Msg();
				msg.setCode(100);
				msg.setMsg("上传文件格式不符");
				return msg;
			}
			//获取上传的绝对路径
			String realPath = request.getSession().getServletContext().getRealPath("/"+"upload/");
			//如果路径不存在 则创建该路径
			File realPathDirectory = new File(realPath);
			if(realPathDirectory==null||!realPathDirectory.exists()){
				realPathDirectory.mkdirs();
			}
			
			String format ="yyyyMMddHHmmss";
            SimpleDateFormat simpleDateFormat =new SimpleDateFormat(format);
            String MyFileName= simpleDateFormat.format(new Date()) + suffix;
			File uploadFile = new File(realPathDirectory+"/"+MyFileName);
			
			try{
				//设置路径 
				SimpleExcelWrite.path = uploadFile.toString();
				file.transferTo(uploadFile);
				//插入数据
				confirmService.insertConfirm();
				
			}catch(Exception e){
				e.printStackTrace();
				return Msg.failed();
			}
			
		}
		return Msg.success();
	}
	
	/**
	 *获取统计数据（收到多少分问卷答案） 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getCountData")
	public Msg getCountData(){
		return Msg.success();
	}
	
	/**
	 * 开启、关闭收集
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/collection")
	public Msg collection(HttpServletRequest request){
		String collectio = request.getParameter("collection");
		Integer anwserId = Integer.parseInt(request.getParameter("anwserId"));
		String path=request.getSession().getServletContext().getRealPath("/fabu")+"\\";
		if(collectio.equals("yes")){
			dataService.collection(path,anwserId);
		}else if(collectio.equals("no")){
			dataService.Nocollection(path,anwserId);
		}
		return Msg.success();
	}
	
	/**
	 *  设置提交完成提示内容
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/setTipMsg")
	public Msg setTipMsg(HttpServletRequest request ){
		String messageContent = request.getParameter("tipMsg");
		dataService.setTipMsg(messageContent);
		promptext.setPromptText(messageContent);
		return Msg.success();
	}
	
	/**
	 * 获取当前时间的12 天前的访问数据量
	 */
	@ResponseBody
	@RequestMapping("/getSubmitCountData")
	public Msg getSubmitCountData(){
		List list = null;
		try {
			list = dataService.getSubmitorByTime(12);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return Msg.success().add("count", list);
	}
	
}
