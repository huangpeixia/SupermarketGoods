package com.supermarketgoods.service;

import com.supermarketgoods.domain.ServiceVO;
import com.supermarketgoods.entity.DamageList;

import java.util.Map;

public interface DamageListGoodsService {

    ServiceVO save(DamageList damageList, String damageListGoodsStr);

    Map<String,Object> list(String sTime, String eTime);

    Map<String,Object> goodsList(Integer damageListId);
}
