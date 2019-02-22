package com.fengyukeji.questionnaire.dao;

import com.fengyukeji.questionnaire.bean.Confirm;
import com.fengyukeji.questionnaire.bean.ConfirmExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ConfirmMapper {
    long countByExample(ConfirmExample example);

    int deleteByExample(ConfirmExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Confirm record);

    int insertSelective(Confirm record);
    
    int insertSelectiveBath(List<Confirm> list);

    List<Confirm> selectByExample(ConfirmExample example);

    Confirm selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Confirm record, @Param("example") ConfirmExample example);

    int updateByExample(@Param("record") Confirm record, @Param("example") ConfirmExample example);

    int updateByPrimaryKeySelective(Confirm record);

    int updateByPrimaryKey(Confirm record);
}