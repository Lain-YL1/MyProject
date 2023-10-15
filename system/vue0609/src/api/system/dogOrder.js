import request from '@/utils/request'

// 查询dogOrder列表
export function listDogOrder(query) {
  return request({
    url: '/system/dogOrder/list',
    method: 'get',
    params: query
  })
}

// 查询dogOrder列表
export function listDogOrderMy(query) {
  return request({
    url: '/system/dogOrder/listMy',
    method: 'get',
    params: query
  })
}
// 查询dogOrder详细
export function getDogOrder(dogOrderId) {
  return request({
    url: '/system/dogOrder/' + dogOrderId,
    method: 'get'
  })
}

// 新增dogOrder
export function addDogOrder(data) {
  return request({
    url: '/system/dogOrder',
    method: 'post',
    data: data
  })
}

// 修改dogOrder
export function updateDogOrder(data) {
  return request({
    url: '/system/dogOrder',
    method: 'put',
    data: data
  })
}

// 删除dogOrder
export function delDogOrder(dogOrderId) {
  return request({
    url: '/system/dogOrder/' + dogOrderId,
    method: 'delete'
  })
}