package com.dongwu.system.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author ww

 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="Chat对象", description="")
public class Chat implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "id")
    @TableId(value = "chat_id", type = IdType.ID_WORKER)
    @JsonSerialize(using= ToStringSerializer.class)
    private Long chatId;

    @ApiModelProperty(value = "发言者id")
    @JsonSerialize(using= ToStringSerializer.class)
    private Long chatUserId;

    @ApiModelProperty(value = "评论菜品id")
    @JsonSerialize(using= ToStringSerializer.class)
    private Long chatDogId;

    @ApiModelProperty(value = "评论内容")
    private String chatContext;

    @ApiModelProperty(value = "所属评论id")
    @JsonSerialize(using= ToStringSerializer.class)

    private Long chatBelongChatId;
    private Long chatUserRole;
    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date gmtCreate;

    @ApiModelProperty(value = "修改时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date gmtUpdate;

    @ApiModelProperty(value = "是否删除")
    @TableLogic
    private Integer deleted;

    @ApiModelProperty(value = "版本号")
    @Version
    private Integer version;


}
