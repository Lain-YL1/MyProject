package com.dongwu.system.config.com.dongwu.common.exception.user;

/**
 * 验证码失效异常类
 * 
 * @author
 */
public class CaptchaExpireException extends UserException
{
    private static final long serialVersionUID = 1L;

    public CaptchaExpireException()
    {
        super("验证码已经失效", null);
    }
}
