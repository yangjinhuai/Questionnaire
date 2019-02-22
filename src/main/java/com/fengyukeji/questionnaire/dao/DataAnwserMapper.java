package com.fengyukeji.questionnaire.dao;

import java.util.List;

import com.fengyukeji.questionnaire.bean.DataAnswer;

/**
 * 自定义的DataAnwser 接口 
 * @author xt
 *
 * 2017年11月17日
 */
public interface DataAnwserMapper {
	//获取数据
	public List<DataAnswer> selectDataAnswer() ;
	
	//获取填表者的编号 用于自动编号
	public Integer selectUserNum();
	
	//更新填表者编号自加
	public void updateUserNum();
	
}
