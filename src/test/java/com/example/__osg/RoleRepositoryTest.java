package com.example.__osg;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.Rollback;

import com.example.__osg.entity.Role;
import com.example.__osg.repository.RoleRepository;

@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(false)
public class RoleRepositoryTest {

	@Autowired
	private RoleRepository roleRepository;
	
	@Test
	public void createRoles() {
		Role userRole = new Role("USER");
		
		Role adminRole = new Role("ADMIN");
		
		roleRepository.save(userRole);
		roleRepository.save(adminRole);
		
		Role existedUserRole = roleRepository.findByName("USER");
		Role existedAdminRole = roleRepository.findByName("ADMIN");
		
		assertThat(existedUserRole).isNotNull();
		assertThat(existedAdminRole).isNotNull();
		assertThat(existedUserRole.getName()).isEqualTo("USER");
		assertThat(existedAdminRole.getName()).isEqualTo("ADMIN");
	}
}
