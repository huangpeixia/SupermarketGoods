package com.supermarketgoods.service;

import com.supermarketgoods.domain.ServiceVO;

public interface GoodsTypeService {

    ServiceVO delete(Integer goodsTypeId);

    ServiceVO save(String goodsTypeName,Integer pId);

    String loadGoodsType();
}
