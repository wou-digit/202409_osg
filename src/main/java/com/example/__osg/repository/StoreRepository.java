package com.example.__osg.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.example.__osg.entity.Store;

@Repository
public interface StoreRepository extends JpaRepository<Store, Long>{

}
