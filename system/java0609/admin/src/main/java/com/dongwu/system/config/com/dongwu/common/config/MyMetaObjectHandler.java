package com.dongwu.system.config.com.dongwu.common.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * mybatis plus 对某个字段自动填充
 */
@Component
public class MyMetaObjectHandler implements MetaObjectHandler {
    //插入时候填充策略
    @Override
    public void insertFill(MetaObject metaObject) {
        //setFieldValByName(String fieldName, Object fieldVal, MetaObject metaObject)
        this.setFieldValByName("gmtCreate",new Date(),metaObject);
        this.setFieldValByName("gmtUpdate",new Date(),metaObject);
    }
    //更新时候的填充策略
    @Override
    public void updateFill(MetaObject metaObject) {
        this.setFieldValByName("gmtUpdate",new Date(),metaObject);
    }
}


