package com.dongwu.web.controller.admin;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.dongwu.system.config.com.dongwu.common.config.ExcludeEmptyQueryWrapper;
import com.dongwu.system.domain.*;
import com.dongwu.system.domain.vo.DogOrderVo;

import com.dongwu.system.service.DogOrderService;
import com.dongwu.system.service.DogService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.dongwu.system.config.com.dongwu.common.annotation.Log;
import com.dongwu.system.config.com.dongwu.common.core.controller.BaseController;
import com.dongwu.system.config.com.dongwu.common.core.domain.AjaxResult;
import com.dongwu.system.config.com.dongwu.common.enums.BusinessType;
import com.dongwu.system.config.com.dongwu.common.core.page.TableDataInfo;

/**
 * dogOrderController
 *

 */
@RestController
@RequestMapping("/system/dogOrder")
public class DogOrderController extends BaseController
{
    @Autowired
    private DogOrderService dogOrderService;
    @Autowired
    private DogService dogService;
    /**
     * 查询dogOrder列表
     */
    @GetMapping("/list")
    public TableDataInfo list(DogOrder dogOrder)
    {
        startPage();
        List<DogOrder> list = dogOrderService.list(new ExcludeEmptyQueryWrapper<DogOrder>().like("dog_user_id",dogOrder.getDogUserId()).eq("dog_order_status",dogOrder.getDogOrderStatus()).like("dog_id",dogOrder.getDogId()).like("dog_name",dogOrder.getDogName()));
        List<DogOrderVo> listVo = new ArrayList<>();
        for (DogOrder one : list){
            Dog dog = dogService.getById(one.getDogId());
            DogOrderVo dogOrderVo = new DogOrderVo();
            if(dog != null){
                dogOrderVo.setDogImg(dog.getDogImg());
            }

            BeanUtils.copyProperties(one,dogOrderVo);
            listVo.add(dogOrderVo);
        }
        return getDataTable(listVo);
    }
    @GetMapping("/listMy")
    public TableDataInfo listMy(DogOrder dogOrder)
    {
        startPage();
        List<DogOrder> list = dogOrderService.list(new ExcludeEmptyQueryWrapper<DogOrder>().like("dog_user_id",getUserId()).eq("dog_order_status",dogOrder.getDogOrderStatus()).like("dog_id",dogOrder.getDogId()).like("dog_name",dogOrder.getDogName()));
        List<DogOrderVo> listVo = new ArrayList<>();
        for (DogOrder one : list){
            Dog dog = dogService.getById(one.getDogId());
            DogOrderVo dogOrderVo = new DogOrderVo();
            if(dog != null){
                dogOrderVo.setDogImg(dog.getDogImg());
            }

            BeanUtils.copyProperties(one,dogOrderVo);
            listVo.add(dogOrderVo);
        }
        return getDataTable(listVo);
    }

    /**
     * 获取dogOrder详细信息
     */
    @GetMapping(value = "/{dogOrderId}")
    public AjaxResult getInfo(@PathVariable("dogOrderId") Long dogOrderId)
    {
        return AjaxResult.success(dogOrderService.getById(dogOrderId));
    }

    /**
     * 新增dogOrder
     */

    @Log(title = "dogOrder", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DogOrder dogOrder)
    {
        return toAjax(dogOrderService.save(dogOrder));
    }

    /**
     * 修改dogOrder
     */

    @Log(title = "dogOrder", businessType = BusinessType.UPDATE)
    @PutMapping
    @Transactional
    public AjaxResult edit(@RequestBody DogOrder dogOrder)
    {

        if(dogOrder.getDogOrderStatus() !=null){
            if(dogOrder.getDogOrderStatus() == 2){
                DogOrder dogOrderNow = dogOrderService.getById(dogOrder.getDogOrderId());
                Dog dog = dogService.getById(dogOrderNow.getDogId());
                if(dog.getDogStatus() == 5){
                    return  AjaxResult.error("已经被安排领养");
                }
                dog.setDogBelongUserId(dogOrderNow.getDogUserId());
                dog.setDogStatus(5);
                dogService.updateById(dog);
            }
        }
        
        return toAjax(dogOrderService.updateById(dogOrder));
    }

    /**
     * 删除dogOrder
     */

    @Log(title = "dogOrder", businessType = BusinessType.DELETE)
	@DeleteMapping("/{dogOrderIds}")
    public AjaxResult remove(@PathVariable Long[] dogOrderIds)
    {
        return toAjax(dogOrderService.removeByIds(Arrays.asList(dogOrderIds)));
    }
}