package net.rah.os.controller;

import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.rah.osbackend.dao.CategoryDAO;
import net.rah.osbackend.dao.ProductDAO;
import net.rah.osbackend.dto.Category;
import net.rah.osbackend.dto.Product;

@Controller
@RequestMapping("/manage")
public class ManagementContoller {

	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private static final Logger logger=LoggerFactory.getLogger(ManagementContoller.class);
	
	@RequestMapping(value="/products",method=RequestMethod.GET)
	public ModelAndView showManageProducts(@RequestParam(name="operation",required=false)String operation) {
		
		ModelAndView mv=new ModelAndView("page");
		
		if(operation!=null) {
			if(operation.equals("product")) {
				mv.addObject("message","Product submitted successfully!");
			}
		}
		
		Product nProduct=new Product();
		
		nProduct.setSupplierId(1);
		nProduct.setActive(true);
		
		mv.addObject("product",nProduct);
		
		mv.addObject("title","Manage Products");
		mv.addObject("userClickManageProducts",true);
		
		return mv;
	}
	
	@ModelAttribute("categories")
	public List<Category> getCategories(){
		return categoryDAO.list();
	}
	
	@RequestMapping(value="/products",method=RequestMethod.POST)
	public String handleProductSubmission(@Valid @ModelAttribute("product")Product mProduct,BindingResult results,Model model) {
		
		if(results.hasErrors()) {
			model.addAttribute("title","Manage Products");
			model.addAttribute("userClickManageProducts",true);
			model.addAttribute("message","Validation failed for Product Submission!");
			
			return "page";
		}
		
		logger.info(mProduct.toString());
		productDAO.add(mProduct);
		
		return "redirect:/manage/products?operation=product";
	}
	
}
