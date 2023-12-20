package com.supermarketgoods.dao;

import com.supermarketgoods.entity.OverflowList;
import com.supermarketgoods.entity.OverflowListGoods;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import org.springframework.stereotype.Repository;
@Repository
public interface OverflowListGoodsDao {

    Integer saveOverflowList(OverflowList overflowList);

    Integer saveOverflowListGoods(OverflowListGoods overflowListGoods);

    List<OverflowList> getOverflowlist(@Param("sTime") String sTime, @Param("eTime") String eTime);

    List<OverflowListGoods> getOverflowListGoodsByOverflowListId(Integer overflowListId);
}
