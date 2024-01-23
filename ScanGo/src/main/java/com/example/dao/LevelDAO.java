package com.example.dao;

import java.util.List;
import java.util.Optional;

import com.example.entity.Category;
import com.example.entity.Level;

public interface LevelDAO {

	//根據Level ID找到Level名稱
	Optional<Level> findLevelNameById(Integer LevelId);
	
}
