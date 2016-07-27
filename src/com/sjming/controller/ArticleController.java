package com.sjming.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/article")
public class ArticleController {

	@RequestMapping("/list.do")
	public String index() {
		return "article/list";
	}
}
