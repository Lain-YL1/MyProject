import request from '@/utils/request'

export default{

  //查询订单列表
  // PaylistById(userid) {
  //   return request({
  //     url: '/Pay-api/order-info/PaylistById/' + userid,
  //     method: 'get' 
  //   })
  // },
  PaylistById(userid) {
    return request({
      url: '/WebOrderInfo/getOrderInfolist/' + userid,
      method: 'get'
    })
  },
  PaylistAll(status) {
    return request({
      url: '/WebOrderInfo/getOrderInfolist/all/'+status,
      method: 'get'
    })
  },

  updateOrder(data){
    return request({
      url: '/WebOrderInfo/updateOrder',
      method: 'post',
      data:data
    })
  },

  quitOrder(data){
    return request({
      url: '/WebOrderInfo/quitOrder',
      method: 'post',
      data:data
    })
  }
 
}
