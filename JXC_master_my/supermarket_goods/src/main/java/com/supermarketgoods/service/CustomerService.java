package com.supermarketgoods.service;

import com.supermarketgoods.domain.ServiceVO;
import com.supermarketgoods.entity.Customer;

import java.util.List;
import java.util.Map;

public interface CustomerService {

    Map<String,Object> list(Integer page, Integer rows, String customerName);

    ServiceVO save(Customer customer);

    ServiceVO delete(String ids);

    List<Customer> getComboboxList(String q);
}
