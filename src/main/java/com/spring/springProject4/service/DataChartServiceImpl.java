package com.spring.springProject4.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.springProject4.dao.DataChartDao;

@Service
public class DataChartServiceImpl implements DataChartService {

    @Autowired
    private DataChartDao dataChartDao;

}