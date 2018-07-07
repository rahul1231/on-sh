package net.rah.osbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.rah.osbackend.dao.CategoryDAO;
import net.rah.osbackend.dao.ProductDAO;
import net.rah.osbackend.dto.Product;

public class ProductTestCase {

private static AnnotationConfigApplicationContext context;
	
	private static ProductDAO productDAO;
	
	private Product product;
	
	@BeforeClass
	public static void init() {
		
		context=new AnnotationConfigApplicationContext();
		context.scan("net.rah.osbackend.*");
		context.refresh();
		
		productDAO=(ProductDAO)context.getBean("productDAO");
		
	}
	
	
	@Test
	public void testGetProduct() {
		
		product=productDAO.get(3);
		product.setName("Google Pixel 5");
		assertEquals("Failure",true,productDAO.update(product));
		assertEquals("Failure",true,productDAO.delete(product));
		assertEquals("Failure",5,productDAO.list().size());
	}
	
}
