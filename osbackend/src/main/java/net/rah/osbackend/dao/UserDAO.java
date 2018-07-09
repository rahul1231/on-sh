package net.rah.osbackend.dao;

import java.util.List;

import net.rah.osbackend.dto.Address;
import net.rah.osbackend.dto.Cart;
import net.rah.osbackend.dto.User;

public interface UserDAO {

	//add a user
	boolean addUser(User user);
	User getByEmail(String email);
	
	//add address
	boolean addAddress(Address address);
	Address getBillingAddress(User user);
	List<Address> listShippingAddresses(User user);
	
	//update cart
	boolean updateCart(Cart cart);
	
	
}
