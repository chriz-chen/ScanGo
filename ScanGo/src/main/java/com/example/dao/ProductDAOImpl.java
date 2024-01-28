package com.example.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.example.entity.Product;

import java.sql.PreparedStatement;
import java.sql.Statement;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

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
		products.forEach(productList -> {
			categoryDao.findCategoryById(productList.getCategoryId()).ifPresent(productList::setCategory);
		});
		
		return products;
	}
	
	//查詢所有上架商品(多筆)
	@Override
	public List<Product> findAllLaunchProducts() {
		String sql = "select * from product where isLaunch = true";
		List<Product> products = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Product.class));
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
	public List<Product> findLaunchProductsByCategoryId(Integer categoryId) {
		String sql = "select * from product where categoryId = ? and isLaunch = true";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Product.class), categoryId);
	}

//	//新增商品
//	@Override
//	public void addProduct(Product product) {
//		String sql = "INSERT INTO product (productName, price, unit, categoryId, inventory, picture, position) VALUES (?, ?, ?, ?, ?, ?, ?)";
//
//		String picture = "/ScanGo/image/product/" + product.getPicture();
//		
//	    jdbcTemplate.update(sql, product.getProductName(), product.getPrice(), product.getUnit(), product.getCategoryId(),
//	    						product.getInventory(), picture, product.getPosition());
//	    
//	}
	
	
	@Override
	// 新增商品 qrcode 版本
	public void addProduct(Product product) {
	    String sql = "INSERT INTO product (productName, price, unit, categoryId, inventory, picture, position) VALUES (?, ?, ?, ?, ?, ?, ?)";

	    String picture = "/ScanGo/image/product/" + product.getPicture();

	    KeyHolder keyHolder = new GeneratedKeyHolder();

	    jdbcTemplate.update(new PreparedStatementCreator() {
	        @Override
	        public PreparedStatement createPreparedStatement(java.sql.Connection connection) throws java.sql.SQLException {
	            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	            ps.setString(1, product.getProductName());
	            ps.setInt(2, product.getPrice());
	            ps.setString(3, product.getUnit());
	            ps.setInt(4, product.getCategoryId());
	            ps.setInt(5, product.getInventory());
	            ps.setString(6, picture);
	            ps.setString(7, product.getPosition());
	            return ps;
	        }
	    }, keyHolder);

	    // 获取生成的主键值
	    Number generatedId = keyHolder.getKey();
	    if (generatedId != null) {
	        int productId = generatedId.intValue();
	        // 将生成的主键值设置回Product对象
	        product.setProductId(productId);
	    }
	}
	
	//修改商品資料
	public void updateProduct(Product product) {
	    String sql = "UPDATE product SET productName = ?, price = ?, unit = ?, categoryId = ?, inventory = ?, picture = ?, position = ? WHERE productId = ?";

	    jdbcTemplate.update(sql, product.getProductName(), product.getPrice(), product.getUnit(),
	            product.getCategoryId(), product.getInventory(), product.getPicture(), product.getPosition(),
	            product.getProductId());
	}
	
	//變更商品上架狀態
	@Override
	public Boolean updateProductLaunch(Integer productId, Boolean isLaunch) {
		String sql = "update product set isLaunch = ? where productId = ?";

		return jdbcTemplate.update(sql, isLaunch, productId) > 0;
	}

	// 刪除商品
	@Override
	public void deleteProduct(Integer productId) {
	    String sql = "DELETE FROM product WHERE productId = ?";
	    jdbcTemplate.update(sql, productId);
	}
	
}
