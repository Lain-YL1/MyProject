package com.dongwu.system.config.com.dongwu.common.core.domain.model;

import lombok.Data;

/**
 * 用户登录对象
 * 
 * @author
 */
@Data
public class LoginBody
{
    /**
     * 用户名
     */
    private String username;

    private String nickname;

    /**
     * 用户密码
     */
    private String password;

    /**
     * 验证码
     */
    private String code;

    /**
     * 唯一标识
     */
    private String uuid;

    /**
     * 登录部门的id
     */
    private String deptId;


}
