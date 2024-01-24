package com.example.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.example.entity.Category;
import com.example.entity.Product;

@Component("productDaoImpl")
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	@Qualifier("categoryDaoImpl")
	private CategoryDAO categoryDao;
	
	//查詢所有商品(多筆)
	@Override
	public List<Product> findAllProducts() {
		String sql = "select * from product";
		List<Product> products = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Product.class));
		products.forEach(productItem -> {
			categoryDao.findCategoryById(productItem.getCategoryId()).ifPresent(productItem::setCategory);
		});
		
		return products;
	}

	//根據產品ID來查找商品(單筆)
	@Override
	public Optional<Product> findProductById(Integer productId) {
		String sql = "select * from product where productId = ?";
		try {
			Product product = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Product.class), productId);
			return Optional.ofNullable(product);
		} catch (EmptyResultDataAccessException e) {
			return Optional.empty();
		}
	}
	
	//根據類別ID來查找商品(多筆)
	@Override
	public List<Product> findProductsByCategoryId(Integer categoryId) {
		String sql = "select * from product where categoryId = ?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Product.class), categoryId);
	}

	//新增商品
	@Override
	public void addProduct(Product product) {
		String sql = "INSERT INTO product (productName, price, unit, categoryId, inventory, picture) VALUES (?, ?, ?, ?, ?, ?)";

	    try {
	    	// Assuming product.getPicture() returns byte[] data of the image
	    	jdbcTemplate.update(sql, product.getProductName(), product.getPrice(), product.getUnit(),
	    			product.getCategoryId(), product.getInventory(), product.getPicture());
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	//修改商品資料
	@Override
	public Boolean updateInventory(Integer productId, Integer inventory) {
		
		return null;
	}

	//變更商品上架狀態
	@Override
	public Boolean updateProductLaunch(Integer productId, Boolean isLaunch) {
		String sql = "update product set isLaunch = ? where productId = ?";

		return jdbcTemplate.update(sql, isLaunch, productId) > 0;
	}
}
