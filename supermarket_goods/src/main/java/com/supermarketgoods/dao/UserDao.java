package com.supermarketgoods.dao;

import com.supermarketgoods.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import org.springframework.stereotype.Repository;
@Repository
public interface UserDao {

    // 根据用户名查找用户
    User findUserByName(@Param("userName") String userName);

    // 根据用户名称模糊分页查询用户列表
    List<User> getUserList(@Param("offSet") Integer offSet,@Param("pageRow") Integer pageRow,@Param("userName") String userName);

    // 根据用户名称模糊查询用户列表的数量
    Integer getUserCount(@Param("userName") String userName);

    // 新增用户
    Integer addUser(User user);

    // 更新用户
    Integer updateUser(User user);

    // 根据用户id查询用户
    User getUserById(Integer userId);

    // 根据用户id删除用户
    Integer deleteUser(Integer userId);


}
