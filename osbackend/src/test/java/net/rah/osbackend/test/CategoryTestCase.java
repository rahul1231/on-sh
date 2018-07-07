package net.rah.osbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.rah.osbackend.dao.CategoryDAO;
import net.rah.osbackend.dto.Category;

public class CategoryTestCase {

	private static AnnotationConfigApplicationContext context;
	
	private static CategoryDAO categoryDAO;
	
	private Category category;
	
	@BeforeClass
	public static void init() {
		
		context=new AnnotationConfigApplicationContext();
		context.scan("net.rah.osbackend.*");
		context.refresh();
		
		categoryDAO=(CategoryDAO)context.getBean("categoryDAO");
		
	}
	
	/*
	@Test
	public void testAddCategory() {
		
		category=new Category();
		
		category.setName("Television");
		category.setDescription("This is some description for television!");
		category.setImageURL("CAT_1.png");
		
		assertEquals("Failure!!!",true,categoryDAO.add(category));
	}
	*/
	
	/*
	@Test
	public void testGetCategory() {
		
		category=categoryDAO.get(1);
		
		assertEquals("Failure!!!","Television",category.getName());
	}
	*/
	
	/*
	@Test
	public void testUpdateCategory() {
		
		category=categoryDAO.get(1);
		category.setName("TV");
		
		assertEquals("Failure!!!",true,categoryDAO.update(category));
	}
	*/
	
	/*
	@Test
	public void testDeleteCategory() {
		
		category=categoryDAO.get(1);
		
		assertEquals("Failure!!!",true,categoryDAO.delete(category));
	}
	*/
	
	/*
	@Test
	public void testListCategory() {
		
		assertEquals("Failure!!!",0,categoryDAO.list().size());
	}
	*/
	
	
	@Test
	public void testCRUDCategory() {
		
		category=new Category();
		
		category.setName("Television");
		category.setDescription("This is some description for television!");
		category.setImageURL("CAT_1.png");
		
		assertEquals("Failure!!!",true,categoryDAO.add(category));
		
		category=new Category();
		
		category.setName("Laptop");
		category.setDescription("This is some description for laptop!");
		category.setImageURL("CAT_2.png");
		
		assertEquals("Failure!!!",true,categoryDAO.add(category));
		
		//get the category
		category=categoryDAO.get(1);
		
		assertEquals("Failure!!!","Television",category.getName());
		
		//update the category
		category=categoryDAO.get(1);
		category.setName("TV");
		
		assertEquals("Failure!!!",true,categoryDAO.update(category));
		
		//delete the category
		category=categoryDAO.get(1);
		
		assertEquals("Failure!!!",true,categoryDAO.delete(category));
		
		//list of categories
		assertEquals("Failure!!!",1,categoryDAO.list().size());
	}
	
	
	
}
