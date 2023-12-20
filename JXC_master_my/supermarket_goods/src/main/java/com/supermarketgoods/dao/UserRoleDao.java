package com.supermarketgoods.dao;

import com.supermarketgoods.entity.UserRole;
import org.springframework.stereotype.Repository;
@Repository
public interface UserRoleDao {

    // 根据用户id删除用户角色
    Integer deleteUserRoleByUserId(Integer userId);

    // 为用户添加角色
    Integer addUserRole(UserRole userRole);
}
