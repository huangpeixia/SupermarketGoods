package com.supermarketgoods.service;

import javax.servlet.http.HttpSession;

public interface MenuService {

    String loadMenu(HttpSession session);

    String loadCheckMenu(Integer roleId);

}
