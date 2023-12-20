package com.supermarketgoods.dao;

import com.supermarketgoods.entity.Unit;

import java.util.List;
import org.springframework.stereotype.Repository;
@Repository
public interface UnitDao {

    Integer saveUnit(Unit unit);

    Integer delete(Integer unitId);

    List<Unit> listAll();

    Unit getUnitByUnitId(Integer unitId);
}
