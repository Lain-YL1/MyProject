package com.dongwu.system.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dongwu.system.domain.Type;
import com.dongwu.system.mapper.TypeMapper;
import com.dongwu.system.service.TypeService;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ikun

 */
@Service
public class TypeServiceImpl extends ServiceImpl<TypeMapper, Type> implements TypeService {

}
