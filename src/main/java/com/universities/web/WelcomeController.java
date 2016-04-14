package com.university.web;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.university.service.HelloWorldService;

@Controller
public class WelcomeController {

	private final Logger logger = LoggerFactory.getLogger(WelcomeController.class);
	private final HelloWorldService helloWorldService;

	@Autowired
	public WelcomeController(HelloWorldService helloWorldService) {
		this.helloWorldService = helloWorldService;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {

		logger.debug("index() is executed!");
		ModelAndView model = new ModelAndView();
		model.setViewName("index");
		return model;
	}

	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView index() {

		logger.debug("index() is executed!");
		ModelAndView model = new ModelAndView();
		model.setViewName("index");
		return model;
	}

	@RequestMapping(value = "/hello/{name:.+}", method = RequestMethod.GET)
	public ModelAndView hello(@PathVariable("name") String name) {

		logger.debug("hello() is executed - $name {}", name);

		ModelAndView model = new ModelAndView();
		model.setViewName("index");
		
		model.addObject("title", helloWorldService.getTitle(name));
		model.addObject("msg", helloWorldService.getDesc());
		
		return model;

	}

	@RequestMapping(value = "/stressMap", method = RequestMethod.GET)
	public ModelAndView stressMap() {

		logger.debug("return stress map home page");

		ModelAndView model = new ModelAndView();
		model.setViewName("stressMap");
		
		
		return model;

	}

	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public ModelAndView contact() {

		logger.debug("return contact home page");

		ModelAndView model = new ModelAndView();
		model.setViewName("contact");
		
		
		return model;

	}

	@RequestMapping(value = "/schoolRanking", method = RequestMethod.GET)
	public ModelAndView schoolRanking() {

		logger.debug("return school Ranking home page");

		ModelAndView model = new ModelAndView();
		model.setViewName("schoolRanking");
		
		
		return model;

	}

}
