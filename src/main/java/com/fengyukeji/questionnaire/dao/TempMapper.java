package com.fengyukeji.questionnaire.dao;

import com.fengyukeji.questionnaire.bean.Temp;
import com.fengyukeji.questionnaire.bean.TempExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TempMapper {
    long countByExample(TempExample example);

    int deleteByExample(TempExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Temp record);

    int insertSelective(Temp record);

    List<Temp> selectByExample(TempExample example);

    Temp selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Temp record, @Param("example") TempExample example);

    int updateByExample(@Param("record") Temp record, @Param("example") TempExample example);

    int updateByPrimaryKeySelective(Temp record);

    int updateByPrimaryKey(Temp record);
}