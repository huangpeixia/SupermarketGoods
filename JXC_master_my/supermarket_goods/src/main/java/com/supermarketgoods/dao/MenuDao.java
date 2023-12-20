package com.supermarketgoods.dao;


import com.supermarketgoods.entity.Menu;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import org.springframework.stereotype.Repository;
@Repository
public interface MenuDao {

    List<Menu> getMenuByRoleId(Integer roleId);

    // 根据菜单父ID获取当前角色下的菜单信息
    List<Menu> getMenuByParentId(@Param("parentId") Integer parentId, @Param("roleId") Integer roleId);

    // 根据菜单父ID获取属于该菜单id的所有菜单
    List<Menu> getAllMenuByParentId(Integer parentId);
}
