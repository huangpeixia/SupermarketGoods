package com.supermarketgoods.service;

import com.supermarketgoods.domain.ServiceVO;
import com.supermarketgoods.entity.ReturnList;

import java.util.Map;

public interface ReturnListGoodsService {

    ServiceVO save(ReturnList returnList, String returnListGoodsStr);

    Map<String,Object> list(String returnNumber,
                            Integer supplierId,
                            Integer state,
                            String sTime,
                            String eTime);

    Map<String,Object> goodsList(Integer returnListId);

    ServiceVO delete(Integer returnListId);

    ServiceVO updateState(Integer returnListId);

    String count(String sTime, String eTime ,Integer goodsTypeId, String codeOrName);
}
