package com.example.__osg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.__osg.entity.Store;
import com.example.__osg.service.StoreService;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;
	
	@GetMapping("/stores")
	public String getAllStores(Model model) {
		List<Store> stores = storeService.getAllStores();
		
		if(stores != null) {
			model.addAttribute("stores", stores);
		}
		
		return "stores";
	}
	
	@GetMapping("/stores/new")
	public String createNewStorePage() {
		return "store_new";
	}
	
	@PostMapping("/stores/new")
	public String createNewStore(@ModelAttribute("store") Store store, Model model) {
		Store createdStore = storeService.createNewStore(store);
		
		if(createdStore != null) {
			model.addAttribute("msg_success", "Store created successfully.");
			return "redirect:/stores";
			
		} else {
			model.addAttribute("msg_err", "Create store failed.");
			return "store_new";
		}
	}
	
	@PostMapping("/stores/{id}")
	public String deleteStoreById(@PathVariable("id") Long id, Model model) {
		boolean status = storeService.deleteStore(id);
		
		if(status == false) {
			model.addAttribute("err", "Cannot remove store.");
			return "stores";
			
		} else {
			return "redirect:/stores";
		}
	}
}