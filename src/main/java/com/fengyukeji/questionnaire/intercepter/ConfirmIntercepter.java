package com.fengyukeji.questionnaire.intercepter;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.fengyukeji.questionnaire.service.QuetionnaireService;

/**
 * 权限拦截器
 * @author xt
 *
 * 2017年11月26日
 */
public class ConfirmIntercepter implements HandlerInterceptor{
	
	@Autowired
	QuetionnaireService quetionnaireService;
	
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
			String url = request.getRequestURI();
			String requrl = url.substring(url.lastIndexOf("/")+1,url.lastIndexOf("."));
			Integer confirmType = quetionnaireService.getConfrimType(requrl);
																				//判断文件是否存在  确定表单是否收集；
			String serverPath = request.getServletContext().getRealPath("/");
			File file = new File(serverPath+"fabu/"+requrl+".html");
			if(!file.isFile()){
				response.sendRedirect(request.getContextPath()+"/404.jsp");
				return false;
			}
			
			if(confirmType==1||confirmType==0){
				return true;
			}
			if(request.getSession().getAttribute(requrl)!=null){
				return true;
			}
			request.getSession().setAttribute("confirmType", confirmType);
			request.getSession().setAttribute("address", requrl);
			response.addHeader( "Cache-Control", "no-cache" );//浏览器和缓存服务器都不应该缓存页面信息
			response.addHeader( "Cache-Control", "no-store" );//请求和响应的信息都不应该被存储在对方的磁盘
			response.sendRedirect(request.getContextPath()+"/Views/jurisdiction");
		return false;
	}

	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}

}
