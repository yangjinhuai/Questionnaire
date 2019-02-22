package com.fengyukeji.questionnaire.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fengyukeji.questionnaire.bean.Confirm;
import com.fengyukeji.questionnaire.service.ConfirmService;
import com.fengyukeji.questionnaire.service.QuetionnaireService;
import com.fengyukeji.questionnaire.utils.Msg;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 *  身份验证控制器
 * @author xt
 *
 * 2017年11月21日
 */
@RequestMapping("/Confirm")
@Controller
public class ConfirmController {
	
	@Autowired
	ConfirmService confirmService;
	
	@Autowired
	QuetionnaireService quetionnaireService;
	
	
	
	/**
	 * 删除上传的数据
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteDatas")
	public Msg deleteData(){
		confirmService.deleteDatas();
		return Msg.success();
	}
	/**
	 * 判断是否存在验证让认证数据
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkData")
	public Msg checkData(){
		if(confirmService.checkData().isEmpty()){
			return Msg.failed();
		}else{
			return Msg.success();
		}
	}
	
	/**
	 * 设置权限认证状态
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/setConfirmType")
	public Msg setConfirmType(HttpServletRequest request){
		//如果没有权限验证数据 不允许设置权限校验
		if(confirmService.checkData().isEmpty()){
			Msg msg = new Msg();
			msg.setCode(300);
			return msg;
		}
		Integer confirmType = Integer.parseInt(request.getParameter("confirmType"));
		Integer anwserId = Integer.parseInt(request.getParameter("anwserId"));
		quetionnaireService.setConfirmType(anwserId,confirmType);
		return Msg.success();
				
	}
	
	/**
	 *  验证提交的权限验证信息是否正确
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/confirmUser")
	public Msg confirmUser(HttpServletRequest request){
		Integer type = Integer.parseInt(request.getParameter("type"));
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String codE = request.getParameter("codE");
		request.getSession().setAttribute(address, address);
		boolean result = false;
		String serverCode = request.getSession().getAttribute("code").toString();
		
		if(!codE.equalsIgnoreCase(serverCode)){
			Msg msg = new Msg();
			msg.setCode(300);
			return msg;
		}
		//确认属于哪种类型认证
		if(type==2){
			String idx = request.getParameter("number");
			result = confirmService.confirmUseridx(idx,name);
		}else if(type==3){
			String idc = request.getParameter("identity");
			result = confirmService.confirmUseridc(idc,name);
		}else if(type==4){
			String idx = request.getParameter("number");
			String idc = request.getParameter("identity");
			result = confirmService.confirmUser(idx,idc,name);
		}
		if(result){
			return Msg.success();
		}
		return Msg.failed();
	}
	

	/**
	 *  获取全部身份数据
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getForms")
	public Msg getForms(@RequestParam(value="pn",defaultValue = "1")Integer pn,HttpSession session){
		PageHelper.startPage(pn, 6);
		List<Confirm> qusList = confirmService.getForms();
		PageInfo page = new PageInfo(qusList,6);

		return Msg.success().add("form", page);
	}
	
	
	/**
	 *  根据ID删除身份数据
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteOneData")
    public Msg deleteOneData(@RequestParam("id")Integer id){	
		confirmService.deleteOneData(id);
		return Msg.success();
	}
	
	/**
	 *  单个添加身份数据保存
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/saveOneData")
   public Msg saveOneData(HttpServletRequest request,HttpServletResponse response){
		String number=request.getParameter("number");
		String card=request.getParameter("card");
		String name=request.getParameter("name");
		
		List<Confirm> formsList=confirmService.getForms();
		for(int i=0;i<formsList.size();i++) {
			if(formsList.get(i).getIdx().equals(number)) {
				return null;
			}
		}
	    	
		Confirm confirm=new Confirm();
		confirm.setIdx(number);
		confirm.setIdcard(card);
		confirm.setName(name);
		confirmService.saveOneData(confirm);
		return Msg.success();
	}
	/**
	 *  编辑单个身份数据保存
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/editSaveData")
   public Msg editSaveData(HttpServletRequest request,HttpServletResponse response){
		Integer id=Integer.parseInt(request.getParameter("id"));
		String number=request.getParameter("number");
		String card=request.getParameter("card");
		String name=request.getParameter("name");
		
		confirmService.editSaveData(id,number,card,name);
	    
		return Msg.success();
	}
}
