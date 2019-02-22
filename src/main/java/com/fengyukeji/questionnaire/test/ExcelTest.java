package com.fengyukeji.questionnaire.test;

import com.fengyukeji.questionnaire.utils.SimpleExcelWrite;



/**
 * excel 测试
 * @author xt
 *
 * 2017年11月19日
 */
public class ExcelTest {
	
	@org.junit.Test
	public void Test(){
		SimpleExcelWrite simpleExcelWrite =  new SimpleExcelWrite();
		simpleExcelWrite.readExcel();
	}
	
}
