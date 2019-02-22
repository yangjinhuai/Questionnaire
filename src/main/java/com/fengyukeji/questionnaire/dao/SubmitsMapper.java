package com.fengyukeji.questionnaire.dao;

import com.fengyukeji.questionnaire.bean.CountByDate;
import com.fengyukeji.questionnaire.bean.Submits;
import com.fengyukeji.questionnaire.bean.SubmitsExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface SubmitsMapper {
    long countByExample(SubmitsExample example);

    int deleteByExample(SubmitsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Submits record);

    int insertSelective(Submits record);

    List<Submits> selectByExample(SubmitsExample example);
    
    														//自定义根据时间来获取12天前访问
    List<CountByDate> selectByDate(String date);

    Submits selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Submits record, @Param("example") SubmitsExample example);

    int updateByExample(@Param("record") Submits record, @Param("example") SubmitsExample example);

    int updateByPrimaryKeySelective(Submits record);

    int updateByPrimaryKey(Submits record);
}