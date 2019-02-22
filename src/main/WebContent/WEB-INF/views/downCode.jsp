<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="com.fengyukeji.questionnaire.utils.SimpleExcelWrite" %>

<% ByteArrayOutputStream ou=(ByteArrayOutputStream) request.getSession().getAttribute("out");
     response.reset();//清空输出流
 
    //下面是对中文文件名的处理
    response.setCharacterEncoding("UTF-8");//设置相应内容的编码格式
    String  fname = java.net.URLEncoder.encode("答题二维码","UTF-8");
    response.setHeader("Content-Disposition","attachment;filename="+new String(fname.getBytes("UTF-8"),"GBK")+".png");
    response.setContentType("application/png");//定义输出类型
    OutputStream  print = response.getOutputStream();
  
    print.write(ou.toByteArray());
    print.flush();
    print.close(); 
 %>


<html>
  <head>
    
    <title></title>

  </head>
  
  <body>
  </body>
</html>