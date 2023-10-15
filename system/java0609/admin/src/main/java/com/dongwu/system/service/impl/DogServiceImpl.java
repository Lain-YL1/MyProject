package com.dongwu.system.service.impl;

import com.dongwu.system.domain.Dog;
import com.dongwu.system.mapper.DogMapper;
import com.dongwu.system.service.DogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ikun

 */
@Service
public class DogServiceImpl extends ServiceImpl<DogMapper, Dog> implements DogService {

}
