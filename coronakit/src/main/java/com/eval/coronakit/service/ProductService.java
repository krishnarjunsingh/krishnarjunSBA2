package com.eval.coronakit.service;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import com.eval.coronakit.entity.ProductMaster;
import java.util.Optional;

public interface ProductService {

	public ProductMaster addNewProduct(ProductMaster product);
	public List<ProductMaster> getAllProducts();
	public ProductMaster deleteProduct(int productId);
	//public ProductMaster getProductById(int productId);
	public Optional<ProductMaster> getProductById(int productId);
	 
	Page<ProductMaster> findAllProductsPageable(Pageable pageable);

}
