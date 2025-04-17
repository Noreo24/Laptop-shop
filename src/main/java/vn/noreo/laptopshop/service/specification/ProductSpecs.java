package vn.noreo.laptopshop.service.specification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import vn.noreo.laptopshop.domain.Product;
import vn.noreo.laptopshop.domain.Product_;

public class ProductSpecs {

    public static Specification<Product> searchByName(String name) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
    }

    public static Specification<Product> searchByMinPrice(double minPrice) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.ge(root.get(Product_.PRICE),
                minPrice);
    }

    public static Specification<Product> searchByMaxPrice(double maxPrice) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.le(root.get(Product_.PRICE), maxPrice);
    }

    public static Specification<Product> searchByFactory(String factory) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.equal(root.get(Product_.FACTORY), factory);
    }

    public static Specification<Product> searchByListFactory(List<String> listFactory) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Product_.FACTORY)).value(listFactory);
    }

    public static Specification<Product> searchByListTarget(List<String> listTarget) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Product_.TARGET)).value(listTarget);
    }

    public static Specification<Product> searchByPriceRange(double minPrice, double maxPrice) {
        return (root, query, criteriaBuilder) ->
        // criteriaBuilder.between(root.get(Product_.PRICE), minPrice, maxPrice);
        criteriaBuilder.and(
                criteriaBuilder.ge(root.get(Product_.PRICE), minPrice),
                criteriaBuilder.le(root.get(Product_.PRICE), maxPrice));
    }

    public static Specification<Product> searchByPriceRanges(double minPrice, double maxPrice) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.between(root.get(Product_.PRICE), minPrice, maxPrice);
    }
}
