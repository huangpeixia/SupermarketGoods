package com.supermarketgoods.dao;

import com.supermarketgoods.entity.Customer;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface CustomerDao {

    List<Customer> getCustomerList(@Param("offSet") Integer offSet, @Param("pageRow") Integer pageRow, @Param("customerName") String customerName);

    Integer getCustomerCount(@Param("customerName") String customerName);

    Integer saveCustomer(Customer customer);

    Integer updateCustomer(Customer customer);

    Customer getCustomerById(Integer customerId);

    Integer deleteCustomer(Integer customerId);

    List<Customer> getCustomerListByNameLike(@Param("q") String q);
}
