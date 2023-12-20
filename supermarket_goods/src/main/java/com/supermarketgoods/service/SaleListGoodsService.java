package com.supermarketgoods.service;

import com.supermarketgoods.domain.ServiceVO;
import com.supermarketgoods.entity.SaleList;

import java.util.Map;

public interface SaleListGoodsService {

    Integer getSaleTotalByGoodsId(Integer goodsId);

    ServiceVO save(SaleList saleList, String saleListGoodsStr);

    Map<String,Object> list(String saleNumber, Integer customerId, Integer state, String sTime,
                            String eTime);

    Map<String,Object> goodsList(Integer saleListId);

    ServiceVO delete(Integer saleListId);

    ServiceVO updateState(Integer saleListId);

    String count(String sTime, String eTime ,Integer goodsTypeId, String codeOrName);

    String getSaleDataByDay(String sTime, String eTime);

    String getSaleDataByMonth(String sTime, String eTime);
}
