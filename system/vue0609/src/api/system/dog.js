import request from '@/utils/request'

// 查询dog列表
export function listDog(query) {
  return request({
    url: '/system/dog/list',
    method: 'get',
    params: query
  })
}
// 查询dog列表
export function listDogMy(query) {
  return request({
    url: '/system/dog/listMy',
    method: 'get',
    params: query
  })
}

// 查询dog详细
export function getDog(dogId) {
  return request({
    url: '/system/dog/' + dogId,
    method: 'get'
  })
}
// 查询dog详细
export function lingyang(data) {
  return request({
    url: '/system/dog/lingyang',
    method: 'post',
    data:data
  })
}
// 新增dog
export function addDog(data) {
  return request({
    url: '/system/dog',
    method: 'post',
    data: data
  })
}

// 修改dog
export function updateDog(data) {
  return request({
    url: '/system/dog',
    method: 'put',
    data: data
  })
}

// 删除dog
export function delDog(dogId) {
  return request({
    url: '/system/dog/' + dogId,
    method: 'delete'
  })
}