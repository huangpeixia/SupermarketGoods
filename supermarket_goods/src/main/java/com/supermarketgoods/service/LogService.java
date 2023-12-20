package com.supermarketgoods.service;

import com.supermarketgoods.entity.Log;

public interface LogService {

    void save(Log log);

    String list(String logType,String trueName,String sTime,String eTime,Integer page,Integer rows);
}
