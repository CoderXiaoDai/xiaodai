import request from '@/utils/request'

// 查询商品表SKU列表
export function listSku(query) {
  return request({
    url: '/system/sku/list',
    method: 'get',
    params: query
  })
}

// 查询商品表SKU详细
export function getSku(id) {
  return request({
    url: '/system/sku/' + id,
    method: 'get'
  })
}

// 新增商品表SKU
export function addSku(data) {
  return request({
    url: '/system/sku',
    method: 'post',
    data: data
  })
}

// 修改商品表SKU
export function updateSku(data) {
  return request({
    url: '/system/sku',
    method: 'put',
    data: data
  })
}

// 删除商品表SKU
export function delSku(id) {
  return request({
    url: '/system/sku/' + id,
    method: 'delete'
  })
}
