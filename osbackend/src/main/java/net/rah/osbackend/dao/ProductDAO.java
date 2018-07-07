package net.rah.osbackend.dao;

import java.util.List;

import net.rah.osbackend.dto.Product;

public interface ProductDAO {

	List<Product> list();
	Product get(int productId);
	
	boolean add(Product product);
	boolean update(Product product);
	boolean delete(Product product);
	
	//business methods
	List<Product> listActiveProducts();
	List<Product> listActiveProductsByCategory(int categoryId);
	List<Product> getLatestActiveProducts(int count);
	
}
