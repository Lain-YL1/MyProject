import request from '@/utils/request'

// 查询chat列表
export function listChat(query) {
  return request({
    url: '/system/chat/list',
    method: 'get',
    params: query
  })
}

// 查询chat列表
export function getFoodChat(query) {
    return request({
      url: '/system/chat/getFoodChat',
      method: 'get',
      params: query
    })
  }
// 查询chat详细
export function getChat(chatId) {
  return request({
    url: '/system/chat/' + chatId,
    method: 'get'
  })
}

// 新增chat
export function addChat(data) {
  return request({
    url: '/system/chat',
    method: 'post',
    data: data
  })
}

// 修改chat
export function updateChat(data) {
  return request({
    url: '/system/chat',
    method: 'put',
    data: data
  })
}

// 删除chat
export function delChat(chatId) {
  return request({
    url: '/system/chat/' + chatId,
    method: 'delete'
  })
}