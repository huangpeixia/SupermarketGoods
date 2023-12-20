package com.supermarketgoods.dao;

import com.supermarketgoods.entity.PurchaseList;
import com.supermarketgoods.entity.PurchaseListGoods;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import org.springframework.stereotype.Repository;
@Repository
public interface PurchaseListGoodsDao {

    Integer savePurchaseList(PurchaseList purchaseList);

    Integer savePurchaseListGoods(PurchaseListGoods p);

    List<PurchaseList> getPurchaselist(@Param("purchaseNumber") String purchaseNumber,
                                       @Param("supplierId") Integer supplierId,
                                       @Param("state") Integer state,
                                       @Param("sTime") String sTime,
                                       @Param("eTime") String eTime);

    List<PurchaseListGoods> getPurchaseListGoodsByPurchaseListId(Integer purchaseListId);

    PurchaseList getPurchaseListById(Integer purchaseListId);

    Integer deletePurchaseListById(Integer purchaseListId);

    Integer deletePurchaseListGoodsByPurchaseListId(Integer purchaseListId);

    Integer updateState(Integer purchaseListId);

    List<PurchaseListGoods> getPurchaseListGoods(@Param("purchaseListId") Integer purchaseListId,
                                                 @Param("goodsTypeId") Integer goodsTypeId,
                                                 @Param("codeOrName") String codeOrName);
}
