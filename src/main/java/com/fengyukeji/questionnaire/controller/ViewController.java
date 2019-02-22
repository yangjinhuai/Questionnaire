package com.fengyukeji.questionnaire.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.imageio.stream.FileImageOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.glxn.qrgen.core.image.ImageType;
import net.glxn.qrgen.javase.QRCode;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fengyukeji.questionnaire.bean.QuestionAnswer;
import com.fengyukeji.questionnaire.bean.Quetionnaire;
import com.fengyukeji.questionnaire.bean.SystemInfo;
import com.fengyukeji.questionnaire.service.DataService;
import com.fengyukeji.questionnaire.utils.CreateImageCode;
import com.fengyukeji.questionnaire.utils.Msg;
import com.fengyukeji.questionnaire.utils.SimpleExcelWrite;
import com.fengyukeji.questionnaire.utils.SystemInfoUtil;

/**
 * 视图控制器
 * @author xt
 *
 * 2017年10月28日
 */
@RequestMapping("/Views")
@Controller
public class ViewController {
	@Autowired
	DataService dataService;
	/**
	 * 登录
	 * @return
	 */
	@RequestMapping("/login")
	public String login(){
		
		return "login";
	}
	/**
	 * 首页展示
	 * @return
	 */
	@RequestMapping("/index")
	public String index(){
		return "index";
	}
	/**
	 * 验证码
	 */
	@RequestMapping("/imageCode")
	public void imageCode(HttpServletRequest req, HttpServletResponse response,HttpSession session){
		 // 设置响应的类型格式为图片格式
        response.setContentType("image/jpeg");
        //禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        
        
        CreateImageCode vCode = new CreateImageCode(100,30,5,10);
        session.setAttribute("code", vCode.getCode());
        try {
			vCode.write(response.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 *  添加问卷视图
	 * @return
	 */
	@RequestMapping("/addQuestions")
	public String addQuestions(){
		
		return "addQuestions";
	}
	
	/**
	 *  管理员管理视图
	 * @return
	 */
	@RequestMapping("/adminManage")
	public String adminManage(){
		
		return "adminManage";
	}
	
	/**
	 *  密码修改视图
	 * @return
	 */
	@RequestMapping("/passwordModify")
	public String passwordModify(){
		
		return "passwordModify";
	}
	

	/**
	 *  数据可视化视图
	 * @return
	 */
	@RequestMapping("/dataVisualization")
	public String dataVisualization(){
		
		return "dataVisualization";
	}
	/**
	 *  数据分析视图
	 * @return
	 */
	@RequestMapping("/dataAnalysis")
	public String dataAnalysis(){
		
		return "dataAnalysis";
	}
	
	/**
	 *  表单预览视图
	 * @return
	 */
	@RequestMapping("/previewForm")
	public String previewForm(){	
		return "previewForm";
	}
	/**
	 * 表单编辑视图
	 * @return
	 */
	@RequestMapping("/formManage")
	public String formManage(){
		
		return "formManage";
	}
	
	/**
	 * 生成二维码控制器
	 * @param req
	 * @param response
	 */
	@RequestMapping("/qrImage")
	public void QRImage(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		String qrtext = request.getParameter("url");  
		
        ByteArrayOutputStream out = QRCode.from(qrtext).to(ImageType.PNG).stream();  
        session.setAttribute("out", out);
        
        response.setContentType("image/png");  
        response.setContentLength(out.size());  
   
        OutputStream outStream;
      
        
		try {
			outStream = response.getOutputStream();
			outStream.write(out.toByteArray());  
	        outStream.flush();  
	        outStream.close(); 
		} catch (IOException e) {
			
			e.printStackTrace();
		}  
   
         
	}
	/**
	 * 表单概述视图
	 * @return
	 */
	@RequestMapping("/dataSummarize")
	public String dataSummarize(@RequestParam("id")String id,HttpSession session){
		session.setAttribute("anwserId", id);
		session.setAttribute("host", SystemInfoUtil.host);
		
		return "dataSummarize";
	}
	
	/**
	 * 生成excel视图
	 * @return
	 */
	@RequestMapping("/simpleExcelWrite")
	public String simpleExcelWrite(HttpServletRequest request,HttpSession session){		
		String formName=request.getParameter("formName");
		Integer queId=Integer.parseInt(request.getParameter("queId"));
        session.setAttribute("formName", formName);
        List<QuestionAnswer> questionAnswerList = dataService.getQuestionAnswerById(queId);
        Quetionnaire  quetionnaire = dataService.getQuestion(queId);
		int queNum = quetionnaire.getQuesNum();
		
        List<List<String>>datacol=new ArrayList();       //存数据的每一行每一列
		int allData = questionAnswerList.size()/queNum;
		List<String> list1 = new ArrayList();
		for(int i=0;i<queNum;i++) {
			list1.add(questionAnswerList.get(i).getQueName());
			System.out.println(i+questionAnswerList.get(i).getQueName());
			
		}
		datacol.add(list1);
		for(int i = 0;i<allData;i++){
			List<String> list = new ArrayList();
			for(int j = 0;j<queNum;j++){
				list.add(questionAnswerList.get(i*queNum+j).getAnwser());
				System.out.print(questionAnswerList.get(i*queNum+j).getAnwser());	
					
			}
			datacol.add(list);
		}
		SimpleExcelWrite.ListListData.addAll(datacol);
			
		return "simpleExcelWrite";
	}
	/**
	 * 数据验证
	 * @return
	 */
	@RequestMapping("/comfirmData")
	public String comfirmData(){
		
		return "comfirmData";
	}
	/**
	 * 下载空模板的excel
	 * @return
	 */
	@RequestMapping("/downloadEmptyExcel")
	public String downloadEmptyExcel(){
		
		return "downloadEmptyExcel";
	}
	
	/**
	 * 返回权限验证视图
	 * @return
	 */
	@RequestMapping("/jurisdiction")
	public String jurisdiction(){
		
		return "jurisdiction";
	}
	
	

	
	//下载二维码
	@RequestMapping("/downCode")
	public  String downCode() {
		
		return "downCode";
	}
	
}	

