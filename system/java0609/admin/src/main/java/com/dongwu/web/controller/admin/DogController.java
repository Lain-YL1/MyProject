package com.dongwu.web.controller.admin;

import java.util.Arrays;
import java.util.List;

import com.dongwu.system.config.com.dongwu.common.config.ExcludeEmptyQueryWrapper;
import com.dongwu.system.domain.DogOrder;
import com.dongwu.system.domain.Type;
import com.dongwu.system.service.DogOrderService;
import com.dongwu.system.service.DogService;
import com.dongwu.system.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.dongwu.system.domain.Dog;

import com.dongwu.system.config.com.dongwu.common.core.page.TableDataInfo;

/**
 * dogController
 * 

 */
@RestController
@RequestMapping("/system/dog")
public class DogController extends BaseController
{
    @Autowired
    private DogService dogService;
    @Autowired
    private DogOrderService dogOrderService;
    @Autowired
    private TypeService typeService;
    /**
     * 查询dog列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Dog dog)
    {
        startPage();
        List<Dog> list = dogService.list(new ExcludeEmptyQueryWrapper<Dog>().like("dog_name",dog.getDogName()).eq("dog_type",dog.getDogType()).eq("dog_status",dog.getDogStatus()).like("dog_belong_user_id",dog.getDogBelongUserId()));
        for(Dog one: list){
            Type type = typeService.getById(one.getDogType());

            one.setDogTypeStr(type==null? "未知":type.getTypeName());
        }
        return getDataTable(list);
    }
    @GetMapping("/listMy")
    public TableDataInfo listMy(Dog dog)
    {
        startPage();
        List<Dog> list = dogService.list(new ExcludeEmptyQueryWrapper<Dog>().like("dog_name",dog.getDogName()).eq("dog_type",dog.getDogType()).eq("dog_status",dog.getDogStatus()).like("dog_belong_user_id",dog.getDogBelongUserId()).eq("dog_user_id",getUserId()));
        for(Dog one: list){
            Type type = typeService.getById(one.getDogType());

            one.setDogTypeStr(type==null? "未知":type.getTypeName());
        }
        return getDataTable(list);
    }




    /**
     * 获取dog详细信息
     */

    @GetMapping(value = "/{dogId}")
    public AjaxResult getInfo(@PathVariable("dogId") Long dogId)
    {
        Dog dog =dogService.getById(dogId);
        Type type = typeService.getById(dog.getDogType());
        dog.setDogTypeStr(type==null? "未知":type.getTypeName());
        return AjaxResult.success(dog);
    }
    /**
     * 获取dog详细信息
     */

    @PostMapping(value = "/lingyang")
    public AjaxResult lingyang(@RequestBody DogOrder dogOrder)
    {
        Long dogId = dogOrder.getDogId();
        if(dogOrderService.list(new ExcludeEmptyQueryWrapper<DogOrder>().eq("dog_user_id",getUserId()).eq("dog_id",dogId)).size()>0){
            return AjaxResult.error("已经提交过申请");
        }
        Dog dog = dogService.getById(dogId);
        boolean a =dogOrderService.save(new DogOrder().setDogId(dogId).setDogName(dog.getDogName()).setDogOrderStatus(1).setDogUserId(getUserId()).setDogOrderReason(dogOrder.getDogOrderReason()).setDogOrderFile(dogOrder.getDogOrderFile()));
        if(a){
            return AjaxResult.success("申请成功");

        }
        return AjaxResult.error("请重试");
    }

    /**
     * 新增dog
     */

    @Log(title = "dog", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Dog dog)
    {
        if(dog.getDogUserId()==null){
            dog.setDogUserId(getUserId());
        }
        if(dog.getDogStatus() ==null){
            dog.setDogStatus(1);
        }
        return toAjax(dogService.save(dog));
    }

    /**
     * 修改dog
     */

    @Log(title = "dog", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Dog dog)
    {
        return toAjax(dogService.updateById(dog));
    }

    /**
     * 删除dog
     */
    @Log(title = "dog", businessType = BusinessType.DELETE)
	@DeleteMapping("/{dogIds}")
    public AjaxResult remove(@PathVariable Long[] dogIds)
    {
        return toAjax(
                dogService.removeByIds(Arrays.asList(dogIds)));
    }
}