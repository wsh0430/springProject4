package com.spring.springProject4.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.springProject4.service.DataChartService;

@Controller
@RequestMapping("/dataChart")
public class DataChartController {

  @Autowired
  private DataChartService dataChartService;

	

	
}
