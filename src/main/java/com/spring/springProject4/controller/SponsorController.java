package com.spring.springProject4.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sponsor")
public class SponsorController {
  @GetMapping("/sponsors")
  public String showSponsors() {
      return "sponsor/sponsors"; // sponsorPage.jsp로 이동
  }
}
