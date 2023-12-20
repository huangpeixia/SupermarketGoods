package com.supermarketgoods.dao;

import com.supermarketgoods.entity.Supplier;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import org.springframework.stereotype.Repository;
@Repository
public interface SupplierDao {

    List<Supplier> getSupplierList(@Param("offSet") Integer offSet, @Param("pageRow") Integer pageRow, @Param("supplierName") String supplierName);

    Integer getSupplierCount(@Param("supplierName") String supplierName);

    Integer saveSupplier(Supplier supplier);

    Integer updateSupplier(Supplier supplier);

    Supplier getSupplierById(Integer supplierId);

    Integer deleteSupplier(Integer supplierId);

    List<Supplier> getSupplierListByNameLike(@Param("q") String q);

}
