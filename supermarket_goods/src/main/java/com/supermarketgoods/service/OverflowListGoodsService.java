package com.supermarketgoods.service;

import com.supermarketgoods.domain.ServiceVO;
import com.supermarketgoods.entity.OverflowList;

import java.util.Map;

public interface OverflowListGoodsService {

    ServiceVO save(OverflowList overflowList, String overflowListGoodsStr);

    Map<String,Object> list(String sTime, String eTime);

    Map<String,Object> goodsList(Integer overflowListId);
}
