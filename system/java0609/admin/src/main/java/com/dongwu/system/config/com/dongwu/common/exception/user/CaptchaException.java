package com.dongwu.system.config.com.dongwu.common.exception.user;

/**
 * 验证码错误异常类
 * 
 * @author
 */
public class CaptchaException extends UserException
{
    private static final long serialVersionUID = 1L;

    public CaptchaException()
    {
        super("验证码错误", null);
    }
}
