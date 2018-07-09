package net.rah.osbackend.dao;

import net.rah.osbackend.dto.Address;
import net.rah.osbackend.dto.Cart;
import net.rah.osbackend.dto.User;

public interface UserDAO {

	//add a user
	boolean addUser(User user);
	User getByEmail(String email);
	
	//add address
	boolean addAddress(Address address);
	
	//update cart
	boolean updateCart(Cart cart);
	
	
}
