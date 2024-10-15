package com.example.__osg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

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
	
	@GetMapping("/stores/{id}")
	public String getStorePage(@PathVariable("id") Long id, Model model) {
		Store existedStore = storeService.getStoreById(id);
		
		if(existedStore != null) {
			model.addAttribute("store", existedStore);
			System.err.println("Store found! Allow edit.");
			return "store";

		} else {
			model.addAttribute("errorMessage", "Store not found.");
			return "storeNotFound";
		}
	}
	
	@PostMapping("/stores/{id}/update")
	public String updateStore(@PathVariable("id") Long id, Model model, @ModelAttribute("store") Store store) {
		Store savedStore = storeService.updateStore(id, store);
		
		if(savedStore != null) {
			return "redirect:/stores";
		} else {
			model.addAttribute("errorMessage", "Cannot update store.");
			return "stores";
		}
	}
}
