package com.dongwu.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.Version;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author ikun

 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class DogOrder implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 领养订单
     */
    @TableId(value = "dog_order_id", type = IdType.AUTO)
    @JsonSerialize(using= ToStringSerializer.class)
    private Long dogOrderId;

    /**
     * 狗ID
     */
    @JsonSerialize(using= ToStringSerializer.class)
    private Long dogId;

    /**
     * 用户ID
     */
    @JsonSerialize(using= ToStringSerializer.class)
    private Long dogUserId;

    /**
     * 狗名称
     */
    private String dogName;

    /**
     * 状态
     */
    private Integer dogOrderStatus;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date gmtCreate;

    /**
     * 修改时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private  Date gmtUpdate;

    /**
     * 是否删除
     */
    @TableLogic
    private Integer deleted;

    /**
     * 版本号
     */
    @Version
    private Integer version;

    private String dogOrderReason;

    private String dogOrderFile;

}
