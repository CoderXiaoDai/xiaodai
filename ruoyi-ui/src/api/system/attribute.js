import request from '@/utils/request'

// 查询商品属性表列表
export function listAttribute(query) {
  return request({
    url: '/system/attribute/list',
    method: 'get',
    params: query
  })
}

// 查询商品属性表详细
export function getAttribute(id) {
  return request({
    url: '/system/attribute/' + id,
    method: 'get'
  })
}

// 新增商品属性表
export function addAttribute(data) {
  return request({
    url: '/system/attribute',
    method: 'post',
    data: data
  })
}

// 修改商品属性表
export function updateAttribute(data) {
  return request({
    url: '/system/attribute',
    method: 'put',
    data: data
  })
}

// 删除商品属性表
export function delAttribute(id) {
  return request({
    url: '/system/attribute/' + id,
    method: 'delete'
  })
}
