package vn.ute.dao;

import vn.ute.entity.Product_24162016;

import java.util.List;

public interface IProductDao_24162016 {
    List<Product_24162016> findAll();

    Product_24162016 findById(int productId);
}
