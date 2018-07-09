package net.rah.osbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.rah.osbackend.dao.UserDAO;
import net.rah.osbackend.dto.Address;
import net.rah.osbackend.dto.Cart;
import net.rah.osbackend.dto.User;

public class UserTestCase {

	private static AnnotationConfigApplicationContext context;
	private static UserDAO userDAO;
	private User user=null;
	private Cart cart=null;
	private Address address=null;
	
	@BeforeClass
	public static void init() {
		
		context=new AnnotationConfigApplicationContext();
		context.scan("net.rah.osbackend.*");
		context.refresh();
		
		userDAO=(UserDAO)context.getBean("userDAO");
		
	}
	
	/*
	@Test
	public void testAdd() {
		
		user=new User();
		user.setFirstName("Hrithik");
		user.setLastName("Roshan");
		user.setEmail("hr@gmail.com");
		user.setContactNumber("1234512345");
		user.setRole("USER");
		user.setPassword("123456");
		
		//add the user
		assertEquals("Failure!!!",true,userDAO.addUser(user));
		
		address=new Address();
		address.setAddressLineOne("101/B Jadoo Society,Krishh Nagar");
		address.setAddressLineTwo("Near Kaabil Store");
		address.setCity("Mumbai");
		address.setState("Maharashtra");
		address.setCountry("India");
		address.setPostalCode("400001");
		address.setBiling(true);
		
		//link the user with the address using user id
		address.setUserId(user.getId());
		
		//add the user
		assertEquals("Failure!!!",true,userDAO.addAddress(address));
		
		if(user.getRole().equals("USER")) {
			
			//add a cart
			cart=new Cart();
			cart.setUser(user);
			
			//add the cart
			assertEquals("Failure!!!",true,userDAO.addCart(cart));
			
			//add a shipping address
			address=new Address();
			address.setAddressLineOne("201/B Jadoo Society,Kishan Kanhaiya Nagar");
			address.setAddressLineTwo("Near Kudrat Store");
			address.setCity("Mumbai");
			address.setState("Maharashtra");
			address.setCountry("India");
			address.setPostalCode("400001");
			address.setShipping(true);
			
			//link it with user
			address.setUserId(user.getId());
			
			//add the shipping address
			assertEquals("Failure!!!",true,userDAO.addAddress(address));
		}
		
	}
	*/
	
	/*
	@Test
	public void testAdd() {
		
		user=new User();
		user.setFirstName("Hrithik");
		user.setLastName("Roshan");
		user.setEmail("hr@gmail.com");
		user.setContactNumber("1234512345");
		user.setRole("USER");
		user.setPassword("123456");
		
		
		
		if(user.getRole().equals("USER")) {
			
			//add a cart
			cart=new Cart();
			cart.setUser(user);
			
			//attach cart with the user
			user.setCart(cart);
			
		}
		//add the user
		assertEquals("Failure!!!",true,userDAO.addUser(user));
		
	}
	*/
	
	@Test
	public void testUpdateCart() {
		//fetch the user by its email
		user=userDAO.getByEmail("hr@gmail.com");
		
		//get the cart of the user
		cart=user.getCart();
		
		cart.setGrandTotal(5555);
		cart.setCartLines(2);
		
		assertEquals("Failure!!!",true,userDAO.updateCart(cart));
	}
	
}
