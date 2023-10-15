package com.dongwu.system.domain.vo;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@Accessors(chain = true)
public class ChatVo {
    @JsonSerialize(using= ToStringSerializer.class)
    private Long foodId;
    @JsonSerialize(using= ToStringSerializer.class)
    private Long chatId;
    private String content;
    private Date date;
    private List<ChatVo> sons = new ArrayList<>();
    private String picture;
    @JsonSerialize(using= ToStringSerializer.class)
    private Long userId;
    private String userName;
    private Long chatUserRole;
    private boolean ifMy;

}
