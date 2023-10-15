package com.dongwu.system.config.com.dongwu.common.utils;

import org.springframework.context.MessageSource;
import com.dongwu.system.config.com.dongwu.common.utils.spring.SpringUtils;

/**
 * 获取i18n资源文件
 * 
 * @author
 */
public class MessageUtils
{
    /**
     * 根据消息键和参数 获取消息 委托给spring messageSource
     *
     * @param code 消息键
     * @param args 参数
     * @return 获取国际化翻译值
     */
    public static String message(String code, Object... args)
    {
        MessageSource messageSource = SpringUtils.getBean(MessageSource.class);
        return code;
    }
}
