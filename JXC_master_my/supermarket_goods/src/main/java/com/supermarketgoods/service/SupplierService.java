package com.supermarketgoods.service;

import com.supermarketgoods.domain.ServiceVO;
import com.supermarketgoods.entity.Supplier;

import java.util.List;
import java.util.Map;

public interface SupplierService {

    List<Supplier> getComboboxList(String q);

    Map<String,Object> list(Integer page, Integer rows, String supplierName);

    ServiceVO save(Supplier supplier);

    ServiceVO delete(String ids);
}
