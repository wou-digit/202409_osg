package com.example.__osg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.__osg.entity.Store;
import com.example.__osg.repository.StoreRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class StoreService {

	@Autowired
	private StoreRepository storeRepository;
	
	public List<Store> getAllStores() {
		return storeRepository.findAll();
	}
	
	public Store createNewStore(Store store) {
		return storeRepository.save(store);
	}
	
	public boolean deleteStore(Long id) {
		Store existedStore = storeRepository.getReferenceById(id);
		
		if(existedStore != null) {
			storeRepository.deleteById(id);
			return true;
			
		} else {
			return false;
		}
	}
}