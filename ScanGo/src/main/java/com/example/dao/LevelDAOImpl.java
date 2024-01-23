package com.example.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.example.entity.Level;


@Component("levelDAOImpl")
public class LevelDAOImpl implements LevelDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private LevelDAO levelDAO;

	@Override
	public Optional<Level> findLevelNameById(Integer LevelId) {
		String sql = "select levelId, levelName from level where levelId = ?";
		try {
			Level level = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Level.class), LevelId);
			return Optional.ofNullable(level);
		} catch (EmptyResultDataAccessException e) {
			return Optional.empty();
		}
	}
	
	

}
