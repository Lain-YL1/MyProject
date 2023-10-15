package com.dongwu.system.config.com.dongwu.framework.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.dongwu.system.config.com.dongwu.common.constant.Constants;
import com.dongwu.system.config.com.dongwu.common.constant.UserConstants;
import com.dongwu.system.config.com.dongwu.common.core.domain.entity.SysUser;
import com.dongwu.system.config.com.dongwu.common.core.domain.model.RegisterBody;
import com.dongwu.system.config.com.dongwu.common.core.redis.RedisCache;
import com.dongwu.system.config.com.dongwu.common.exception.user.CaptchaException;
import com.dongwu.system.config.com.dongwu.common.exception.user.CaptchaExpireException;
import com.dongwu.system.config.com.dongwu.common.utils.StringUtils;
import com.dongwu.system.service.ISysConfigService;
import com.dongwu.system.service.ISysUserService;

/**
 * 注册校验方法
 * 
 * @author
 */
@Component
public class SysRegisterService
{
    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private RedisCache redisCache;

    /**
     * 注册
     */
    public String register(RegisterBody registerBody)
    {
        String msg = "", username = registerBody.getUsername(), password = registerBody.getPassword();
        SysUser sysUser2 = new SysUser();
        sysUser2.setUserName(registerBody.getUsername());

        boolean captchaOnOff = configService.selectCaptchaOnOff();
        // 验证码开关
        if (captchaOnOff)
        {
            validateCaptcha(username, registerBody.getCode(), registerBody.getUuid());
        }

        if (StringUtils.isEmpty(username))
        {
            msg = "用户名不能为空";
        }
        else if (StringUtils.isEmpty(password))
        {
            msg = "用户密码不能为空";
        }
        else if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH)
        {
            msg = "账户长度必须在2到20个字符之间";
        }
        else if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH)
        {
            msg = "密码长度必须在5到20个字符之间";
        }
        else if (UserConstants.NOT_UNIQUE.equals(userService.checkUserNameUnique(username)))
        {
            msg = "保存用户'" + username + "'失败，身份证已注册";
        }
        else
        {

            SysUser sysUser = new SysUser();
            sysUser.setUserName(username);
            sysUser.setNickName(registerBody.getNickname());
            sysUser.setDeptId(3L);
            sysUser.setPassword(registerBody.getPassword());
            boolean regFlag = userService.registerUser(sysUser);
            if (!regFlag)
            {
                msg = "注册失败,请联系系统管理人员";
            }
            else
            {
//                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.REGISTER,
//                        MessageUtils.message("user.register.success")));
            }
        }
        return msg;
    }

    /**
     * 校验验证码
     * 
     * @param username 用户名
     * @param code 验证码
     * @param uuid 唯一标识
     * @return 结果
     */
    public void validateCaptcha(String username, String code, String uuid)
    {
        String verifyKey = Constants.CAPTCHA_CODE_KEY + StringUtils.nvl(uuid, "");
        String captcha = redisCache.getCacheObject(verifyKey);
        redisCache.deleteObject(verifyKey);
        if (captcha == null)
        {
            throw new CaptchaExpireException();
        }
        if (!code.equalsIgnoreCase(captcha))
        {
            throw new CaptchaException();
        }
    }
}
