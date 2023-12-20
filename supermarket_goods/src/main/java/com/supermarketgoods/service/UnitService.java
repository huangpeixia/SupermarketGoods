package com.supermarketgoods.service;

import com.supermarketgoods.domain.ServiceVO;
import com.supermarketgoods.entity.Unit;

import java.util.Map;

public interface UnitService {

    ServiceVO save(Unit unit);

    ServiceVO delete(Integer unitId);

    Map<String,Object> list();
}
