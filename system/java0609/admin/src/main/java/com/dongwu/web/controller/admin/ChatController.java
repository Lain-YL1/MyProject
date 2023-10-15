package com.dongwu.web.controller.admin;

import com.dongwu.system.config.com.dongwu.common.annotation.Log;
import com.dongwu.system.config.com.dongwu.common.config.ExcludeEmptyQueryWrapper;
import com.dongwu.system.config.com.dongwu.common.core.controller.BaseController;
import com.dongwu.system.config.com.dongwu.common.core.domain.AjaxResult;
import com.dongwu.system.config.com.dongwu.common.core.page.TableDataInfo;
import com.dongwu.system.config.com.dongwu.common.enums.BusinessType;
import com.dongwu.system.domain.Chat;
import com.dongwu.system.domain.vo.ChatVo;
import com.dongwu.system.service.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * chatController
 * 
 * @author chat
 */
@RestController
@RequestMapping("/system/chat")
public class ChatController extends BaseController
{
    @Autowired
    private ChatService chatService;

    /**
     * 查询chat列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Chat chat)
    {
        startPage();
        List<Chat> list = chatService.list(new ExcludeEmptyQueryWrapper<Chat>().eq("chat_user_id",chat.getChatUserId()).eq("chat_dog_id",chat.getChatDogId()));
        return getDataTable(list);
    }

    /**
     * 获取chat详细信息
     */
    @GetMapping(value = "/{chatId}")
    public AjaxResult getInfo(@PathVariable("chatId") Long chatId)
    {
        return AjaxResult.success(chatService.getById(chatId));
    }

    /**
     * 新增chat
     */
    @Log(title = "chat", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Chat chat)
    {
        chat.setChatUserId(getUserId());
        chat.setChatBelongChatId(0L);
        chat.setChatUserRole(getDeptId());
        return toAjax(
                chatService.save(chat));
    }

    /**
     * 修改chat
     */
    @Log(title = "chat", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Chat chat)
    {

        return toAjax(chatService.updateById(chat));
    }

    /**
     * 删除chat
     */
    @Log(title = "chat", businessType = BusinessType.DELETE)
	@DeleteMapping("/{chatIds}")
    public AjaxResult remove(@PathVariable Long[] chatIds)
    {
        return toAjax(chatService.removeByIds(Arrays.asList(chatIds)));
    }

    /**
     * 查询chat列表
     */
    @GetMapping("/getFoodChat")
    public TableDataInfo getFoodChat(Chat chat)
    {
        startPage();
        List<Chat> list = chatService.list(new ExcludeEmptyQueryWrapper<Chat>().eq("chat_dog_id",chat.getChatDogId()).orderByDesc("gmt_create"));
        List<ChatVo> listNew = new ArrayList<>();
        for(Chat one : list){
            listNew.add(new ChatVo()
                    .setDate(one.getGmtCreate())
                    .setPicture("")
                    .setUserName(one.getChatUserId()+"")
                    .setUserId(one.getChatUserId())
                    .setContent(one.getChatContext())
                    .setFoodId(one.getChatDogId())
                    .setChatId(one.getChatId())
                    .setChatUserRole(one.getChatUserRole())
                    .setIfMy(one.getChatUserId() == getUserId())

            );
        }
        return getDataTable(listNew);
    }

}