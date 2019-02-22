package com.fengyukeji.questionnaire.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.UUID;

import org.junit.Test;

/**
 * 文件创建的和删除的工具类
 * @author xt
 *
 * 2017年11月9日
 */
public class FileUtil {
	
	//生成文件路径
    //private static String path = "D:\\file\\";
    
    //文件路径+名称
    private static String filenameTemp;
    /**
     * 创建文件
     * @param fileName  文件名称
     * @param filecontent   文件内容
     * @return  是否创建成功，成功则返回true
     */
    public static boolean createFile(String path,String fileName,String filecontent){
        Boolean bool = false;
        filenameTemp = path+fileName+".html";//文件路径+名称+文件类型
        File file = new File(filenameTemp);
        try {
            //如果文件不存在，则创建新的文件
            if(!file.exists()){
                file.createNewFile();
                bool = true;
                //System.out.println("success create file,the file is "+filenameTemp);
                //创建文件成功后，写入内容到文件里
            }
            writeFileContent(filenameTemp, filecontent);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bool;
    }
    
    /**
     * 向文件中写入内容
     * @param filepath 文件路径与名称
     * @param newstr  写入的内容
     * @return
     * @throws IOException
     */
    public static boolean writeFileContent(String filepath,String newstr) throws IOException{
        Boolean bool = false;
        String filein = newstr+"\r\n";//新写入的行，换行
        String temp  = "";
        
        FileInputStream fis = null;
        InputStreamReader isr = null;
        BufferedReader br = null;
        //FileOutputStream fos  = null;
        OutputStreamWriter oStreamWriter = null;
        PrintWriter pw = null;
        try {
            File file = new File(filepath);//文件路径(包括文件名称)
            //将文件读入输入流
            fis = new FileInputStream(file);
            isr = new InputStreamReader(fis);
            br = new BufferedReader(isr);
            StringBuffer buffer = new StringBuffer();
            
            //文件原有内容 不需要
//            for(int i=0;(temp =br.readLine())!=null;i++){
//                buffer.append(temp);
//                // 行与行之间的分隔符 相当于“\n”
//                buffer = buffer.append(System.getProperty("line.separator"));
//            }
            buffer.append(filein);
            oStreamWriter = new OutputStreamWriter(new FileOutputStream(file), "utf-8");

            //oStreamWriter.append(buffer);

            //oStreamWriter = new FileOutputStream(file);
            pw = new PrintWriter(oStreamWriter);
            pw.write(buffer.toString().toCharArray());
            pw.flush();
            bool = true;
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }finally {
            //不要忘记关闭
            if (pw != null) {
                pw.close();
            }
            if (oStreamWriter != null) {
                oStreamWriter.close();
            }
            if (br != null) {
                br.close();
            }
            if (isr != null) {
                isr.close();
            }
            if (fis != null) {
                fis.close();
            }
        }
        return bool;
    }
    
    /**
     * 删除文件
     * @param fileName 文件名称
     * @return
     */
    public static boolean delFile(String filePathName){
        Boolean bool = false;
        filenameTemp = filePathName+".html";
        File file  = new File(filenameTemp);
        try {
            if(file.exists()){
                file.delete();
                bool = true;
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return bool;
    }
    
    /** 文件重命名 
     * @param path 文件目录 
     * @param oldname  原来的文件名 
     * @param newname 新文件名 
     */ 
     public static void renameFile(String path,String oldname,String newname){ 
         if(!oldname.equals(newname)){//新的文件名和以前文件名不同时,才有必要进行重命名 
             File oldfile=new File(path+"/"+oldname); 
             File newfile=new File(path+"/"+newname); 
             if(!oldfile.exists()){
                 return;//重命名文件不存在
             }
             if(newfile.exists()){//若在该目录下已经有一个文件和新文件名相同，则不允许重命名 
                // System.out.println(newname+"已经存在！"); 
             }else{ 
                 oldfile.renameTo(newfile); 
             } 
         }else{
            // System.out.println("新文件名和旧文件名相同...");
         }
     }
    
    
    @Test
    public void testFile() {
        UUID uuid = UUID.randomUUID();
        createFile("c:\\",uuid+"myfile", "我的梦说别停留等待,就让光芒折射泪湿的瞳孔,映出心中最想拥有的彩虹,带我奔向那片有你的天空,因为你是我的梦 我的梦");
    }		
}
