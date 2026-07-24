package com.formdigital.formdigital.repository;

import com.formdigital.formdigital.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}
