package com.supermarketgoods.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface DrawImageService {

    void drawImage(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
