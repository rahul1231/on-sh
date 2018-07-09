package net.rah.os.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.rah.os.exception.ProductNotFoundException;
import net.rah.osbackend.dao.CategoryDAO;
import net.rah.osbackend.dao.ProductDAO;
import net.rah.osbackend.dto.Category;
import net.rah.osbackend.dto.Product;

@Controller
public class PageController {

	private static final Logger logger=LoggerFactory.getLogger(PageController.class);
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	@RequestMapping(value={"/","/home","/index"})
	public ModelAndView index() {
		
		ModelAndView mv=new ModelAndView("page");
		
		logger.info("Inside the page controller index method - INFO");
		logger.debug("Inside the page controller index method - DEBUG");
		
		mv.addObject("categories",categoryDAO.list());
		
		mv.addObject("title","Home");
		mv.addObject("userClickHome",true);
		
		return mv;
		
	}
	
	/*
	@RequestMapping("/test")
	public ModelAndView test(@RequestParam("greeting")String greeting) {
		
		ModelAndView mv=new ModelAndView("page");
		
		mv.addObject("greeting",greeting);
		
		return mv;
		
	}
	*/
	/*
	@RequestMapping("/test/{greeting}")
	public ModelAndView test(@PathVariable("greeting")String greeting) {
		
		ModelAndView mv=new ModelAndView("page");
		
		mv.addObject("greeting",greeting);
		
		return mv;
		
	}
	*/
	
	@RequestMapping("/about")
	public ModelAndView about() {
		
		ModelAndView mv=new ModelAndView("page");
		
		mv.addObject("title","About Us");
		mv.addObject("userClickAbout",true);
		
		return mv;
		
	}
	
	@RequestMapping("/contact")
	public ModelAndView contact() {
		
		ModelAndView mv=new ModelAndView("page");
		
		mv.addObject("title","Contact Us");
		mv.addObject("userClickContact",true);
		
		return mv;
		
	}
	
	@RequestMapping("/show/all/products")
	public ModelAndView showAllProducts() {
		
		ModelAndView mv=new ModelAndView("page");
		
		mv.addObject("categories",categoryDAO.list());
		
		mv.addObject("title","All Products");
		mv.addObject("userClickAllProducts",true);
		
		return mv;
		
	}
	
	@RequestMapping("/show/category/{id}/products")
	public ModelAndView showCategoryProducts(@PathVariable("id")int id) {
		
		ModelAndView mv=new ModelAndView("page");
		
		//fetch the category
		Category category=null;
		
		category=categoryDAO.get(id);
		
		mv.addObject("categories",categoryDAO.list());
		
		mv.addObject("title",category.getName());
		
		//passing a single category
		mv.addObject("category",category);
		
		mv.addObject("userClickCategoryProducts",true);
		
		return mv;
		
	}
	
	@RequestMapping(value="/show/{id}/product")
	public ModelAndView showSingleProduct(@PathVariable int id) throws ProductNotFoundException {
		
		ModelAndView mv=new ModelAndView("page");
		
		
		//increment views
		Product product=productDAO.get(id);
		if(product==null) throw new ProductNotFoundException();
		product.setViews(product.getViews()+1);
		
		//update view count
		productDAO.update(product);
		
		mv.addObject("title",product.getName());
		mv.addObject("userClickShowProduct",true);
		
		mv.addObject("product",product);
		
		return mv;
		
	}
	
}
