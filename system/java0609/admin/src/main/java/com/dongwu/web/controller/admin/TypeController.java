package com.dongwu.web.controller.admin;

import java.util.Arrays;
import java.util.List;

import com.dongwu.system.config.com.dongwu.common.config.ExcludeEmptyQueryWrapper;
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
import com.dongwu.system.domain.Type;

import com.dongwu.system.config.com.dongwu.common.core.page.TableDataInfo;

/**
 * typeController
 * 
 * @author type
 */
@RestController
@RequestMapping("/system/type")
public class TypeController extends BaseController
{
    @Autowired
    private TypeService typeService;

    /**
     * 查询type列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Type type)
    {
        startPage();
        List<Type> list = typeService.list(new ExcludeEmptyQueryWrapper<Type>().like("type_name",type.getTypeName()));
        return getDataTable(list);
    }

    /**
     * 获取type详细信息
     */

    @GetMapping(value = "/{typeId}")
    public AjaxResult getInfo(@PathVariable("typeId") Long typeId)
    {
        return AjaxResult.success(typeService.getById(typeId));
    }

    /**
     * 新增type
     */

    @Log(title = "type", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Type type)
    {
        return toAjax(
                typeService.save(type));
    }

    /**
     * 修改type
     */

    @Log(title = "type", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Type type)
    {
        return toAjax(
                typeService.updateById(type));
    }

    /**
     * 删除type
     */

    @Log(title = "type", businessType = BusinessType.DELETE)
	@DeleteMapping("/{typeIds}")
    public AjaxResult remove(@PathVariable Long[] typeIds)
    {
        return toAjax(
                typeService.removeByIds(Arrays.asList(typeIds)));
    }
}