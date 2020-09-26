package com.eval.coronakit.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.eval.coronakit.dao.KitDetailRepository;
import com.eval.coronakit.dao.ProductMasterRepository;
import com.eval.coronakit.entity.KitDetail;
import com.eval.coronakit.entity.ProductMaster;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;

@Service
@Scope(value = WebApplicationContext.SCOPE_SESSION, proxyMode = ScopedProxyMode.TARGET_CLASS)
@Transactional
public class KitDetailServiceImpl implements KitDetailService {

	private final ProductMasterRepository productMasterRepository;
	
	@Autowired
	KitDetailRepository repository;
	
	  private Map<ProductMaster, Integer> products = new HashMap<>();
	  
	 @Autowired
	    public KitDetailServiceImpl(ProductMasterRepository productMasterRepository) {
	        this.productMasterRepository = productMasterRepository;
	    }
	
	@Override
	public void addKitItem(ProductMaster product) {
		 
	            products.put(product, 1);
	        
	}
	 
	@Override
	public KitDetail getKitItemById(int itemId) {
		// TODO Auto-generated method stub
		return this.repository.findById(itemId).orElse(null);
	}

	@Override
	public List<KitDetail> getAllKitItemsOfAKit(int kitId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public KitDetail addKitItem(KitDetail kitItem) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
    public void removeProduct(ProductMaster product) {
		
                products.remove(product);
         
    }

	@Override
	public Map<ProductMaster, Integer> getProductsInCart() {
		// TODO Auto-generated method stub
		return Collections.unmodifiableMap(products);
	}

}
