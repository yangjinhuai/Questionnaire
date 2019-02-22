package com.fengyukeji.questionnaire.dao;

import com.fengyukeji.questionnaire.bean.Quetionnaire;
import com.fengyukeji.questionnaire.bean.QuetionnaireExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface QuetionnaireMapper {
    long countByExample(QuetionnaireExample example);

    int deleteByExample(QuetionnaireExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Quetionnaire record);

    int insertSelective(Quetionnaire record);

    List<Quetionnaire> selectByExampleWithBLOBs(QuetionnaireExample example);

    List<Quetionnaire> selectByExample(QuetionnaireExample example);

    Quetionnaire selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Quetionnaire record, @Param("example") QuetionnaireExample example);

    int updateByExampleWithBLOBs(@Param("record") Quetionnaire record, @Param("example") QuetionnaireExample example);

    int updateByExample(@Param("record") Quetionnaire record, @Param("example") QuetionnaireExample example);

    int updateByPrimaryKeySelective(Quetionnaire record);

    int updateByPrimaryKeyWithBLOBs(Quetionnaire record);

    int updateByPrimaryKey(Quetionnaire record);
}