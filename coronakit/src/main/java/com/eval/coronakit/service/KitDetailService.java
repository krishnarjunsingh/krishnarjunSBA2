package com.eval.coronakit.service;

import java.util.List;
import java.util.Map;

import com.eval.coronakit.entity.KitDetail;
import com.eval.coronakit.entity.ProductMaster;

public interface KitDetailService {
	public KitDetail addKitItem(KitDetail kitItem);
	public KitDetail getKitItemById(int itemId);
	public List<KitDetail> getAllKitItemsOfAKit(int kitId);
	void addKitItem(ProductMaster product);
	void removeProduct(ProductMaster product);
	
	Map<ProductMaster, Integer> getProductsInCart();
}
