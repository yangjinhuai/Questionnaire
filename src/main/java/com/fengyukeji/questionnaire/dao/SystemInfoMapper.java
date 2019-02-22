package com.fengyukeji.questionnaire.dao;

import com.fengyukeji.questionnaire.bean.SystemInfo;
import com.fengyukeji.questionnaire.bean.SystemInfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SystemInfoMapper {
    long countByExample(SystemInfoExample example);

    int deleteByExample(SystemInfoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(SystemInfo record);

    int insertSelective(SystemInfo record);

    List<SystemInfo> selectByExample(SystemInfoExample example);

    SystemInfo selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") SystemInfo record, @Param("example") SystemInfoExample example);

    int updateByExample(@Param("record") SystemInfo record, @Param("example") SystemInfoExample example);

    int updateByPrimaryKeySelective(SystemInfo record);

    int updateByPrimaryKey(SystemInfo record);
}