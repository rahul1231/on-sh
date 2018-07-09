package net.rah.osbackend.dao;

import net.rah.osbackend.dto.Address;
import net.rah.osbackend.dto.Cart;
import net.rah.osbackend.dto.User;

public interface UserDAO {

	//add a user
	boolean addUser(User user);
	
	//add address
	boolean addAddress(Address address);
	
	//add cart
	boolean addCart(Cart cart);
	
	
}
