package net.rah.os.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.rah.os.util.FileUploadUtility;
import net.rah.os.validator.ProductValidator;
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
			else if(operation.equals("category")) {
				mv.addObject("message","Category submitted successfully!");
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
	
	//to handle category submission
	@RequestMapping(value="/category",method=RequestMethod.POST)
	public String handleCategorySubmission(@ModelAttribute Category category) {
		categoryDAO.add(category);
		
		return "redirect:/manage/products?operation=category";
		
	}
	
	
	@ModelAttribute("categories")
	public List<Category> getCategories(){
		return categoryDAO.list();
	}
	
	@ModelAttribute("category")
	public Category getCategory(){
		return new Category();
	}
	
	@RequestMapping(value="/products",method=RequestMethod.POST)
	public String handleProductSubmission(@Valid @ModelAttribute("product")Product mProduct,BindingResult results,Model model,HttpServletRequest request) {
		
		if(mProduct.getId()==0) {
			new ProductValidator().validate(mProduct,results);
		}
		else {
			if(!mProduct.getFile().getOriginalFilename().equals("")) {
				new ProductValidator().validate(mProduct,results);
			}
		}
		
		if(results.hasErrors()) {
			model.addAttribute("title","Manage Products");
			model.addAttribute("userClickManageProducts",true);
			model.addAttribute("message","Validation failed for Product Submission!");
			
			return "page";
		}
		
		logger.info(mProduct.toString());
		if(mProduct.getId()==0) {
			//create a new record if id is 0
			productDAO.add(mProduct);
		}
		else {
			//update the product if id is not 0
			productDAO.update(mProduct);
		}
		
		
		if(!mProduct.getFile().getOriginalFilename().equals("")) {
			FileUploadUtility.uploadFile(request,mProduct.getFile(),mProduct.getCode());
		}
		
		return "redirect:/manage/products?operation=product";
	}
	
	@RequestMapping(value="/product/{id}/activation")
	@ResponseBody
	public String handleProductActivation(@PathVariable int id) {
		
		//is going to fetch the product from the database
		Product product=productDAO.get(id);
		boolean isActive=product.isActive();
		//activating and deactivating based on the value of the active field
		product.setActive(!product.isActive());
		//updating the product
		productDAO.update(product);
		
		return (isActive)? "You have successfully deactivated the product with id "+product.getId():
						  "You have successfully activated the product with id "+product.getId();	
	}
	
	@RequestMapping(value="/{id}/product",method=RequestMethod.GET)
	public ModelAndView showEditProduct(@PathVariable int id) {
		
		ModelAndView mv=new ModelAndView("page");
		
		//fetch the product from the database
		Product nProduct=productDAO.get(id);
		//set the product fetched from the database
		mv.addObject("product",nProduct);
		
		mv.addObject("title","Manage Products");
		mv.addObject("userClickManageProducts",true);
		
		return mv;
	}
	
}
