package com.supermarketgoods.dao;

import com.supermarketgoods.entity.Goods;
import com.supermarketgoods.entity.GoodsType;

import java.util.List;
import org.springframework.stereotype.Repository;
@Repository
public interface GoodsTypeDao {

    List<GoodsType> getAllGoodsTypeByParentId(Integer pId);

    Integer saveGoodsType(GoodsType goodsType);

    GoodsType getGoodsTypeById(Integer goodsTypeId);

    Integer updateGoodsTypeState(GoodsType parentGoodsType);

    List<Goods> getGoodsByTypeId(Integer goodsTypeId);

    Integer delete(Integer goodsTypeId);
}
