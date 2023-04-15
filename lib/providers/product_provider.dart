import 'package:bisiindo/models/category_model.dart';
import 'package:bisiindo/models/product_model.dart';

import 'package:bisiindo/services/product_servece.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<CategoryModel> _products = [];
  List<CategoryModel> get products => _products;

  List<ProductModel> _productsCategories = [];
  List<ProductModel> get productsCategories => _productsCategories;

  set products(List<CategoryModel> products) {
    _products = products;
    notifyListeners();
  }

  set productsCategories(List<ProductModel> productsproductsCategories) {
    _productsCategories = productsCategories;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<CategoryModel> products = await ProductService().getCategories();
      _products = products;
      print('succes');
    } catch (e) {
      print('failed $e');

      print(e);
    }
  }

  Future<void> getProductsCategories(int id) async {
    try {
      List<ProductModel> productsCategories =
          await ProductService().getProductsWithCategories(id);
      _productsCategories = productsCategories;
      print('succes');
    } catch (e) {
      print('failed $e');

      print(e);
    }
  }

  Future<void> getProductsSearch() async {
    try {
      List<ProductModel> productsCategories =
          await ProductService().getProductsWithsearch();
      _productsCategories = productsCategories;
      print('succes');
    } catch (e) {
      print('failed $e');

      print(e);
    }
  }
}
