package com.example.__osg.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.example.__osg.entity.Store;

@Repository
public interface StoreRepository extends JpaRepository<Store, Long>{

	@Query(value = "SELECT s FROM Store s WHERE s.name LIKE '%' || :keyword || '%'"
			+ " OR s.description LIKE '%' || :keyword || '%'"
			+ " OR s.phone LIKE '%' || :keyword || '%'"
			+ " OR s.address LIKE '%' || :keyword || '%'"
			)
	public List<Store> findStoresByKeyword(String keyword);
}
