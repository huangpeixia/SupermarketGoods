package com.supermarketgoods.dao;

import com.supermarketgoods.entity.DamageList;
import com.supermarketgoods.entity.DamageListGoods;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import org.springframework.stereotype.Repository;
@Repository
public interface DamageListGoodsDao {

    Integer saveDamageList(DamageList damageList);

    Integer saveDamageListGoods(DamageListGoods damageListGoods);

    List<DamageList> getDamagelist(@Param("sTime") String sTime,@Param("eTime") String eTime);

    List<DamageListGoods> getDamageListGoodsByDamageListId(Integer damageListId);
}
