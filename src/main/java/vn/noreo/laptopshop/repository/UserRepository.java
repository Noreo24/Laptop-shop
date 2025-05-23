package vn.noreo.laptopshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.noreo.laptopshop.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User noreo);

    List<User> findOneByEmail(String email);

    User findById(long id);

    void deleteById(long id);

    boolean existsByEmail(String email);

    User findByEmail(String email);
}
