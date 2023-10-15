package com.dongwu.system.config.com.dongwu.common.core.domain.entity;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class TestVo {
    private String question;
    private String answer;
}
