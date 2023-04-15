import 'dart:convert';
import 'dart:developer';

import 'package:bisiindo/models/category_model.dart';
import 'package:http/http.dart' as http;
import 'package:bisiindo/models/product_model.dart';

class ProductService {
  String baseUrl = 'https://bisindo.adhyy.my.id/api';

  Future<List<CategoryModel>> getCategories({String query}) async {
    var url = Uri.parse('$baseUrl/category');
    var headers = {'Content_type': 'application/json'};
    var response = await http.get(url, headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];

      List<CategoryModel> categories = [];

      for (var item in data) {
        categories.add(CategoryModel.fromJson(item));
      }
      if (query != null) {
        categories = categories
            .where((element) =>
                element.name.toLowerCase().contains((query.toLowerCase())))
            .toList();
      }
      return categories;
    } else {
      throw Exception('gagal get product!');
    }
  }

  Future<List<ProductModel>> getProductsWithCategories(int id,
      {String query}) async {
    var url = Uri.parse('$baseUrl/products?categories=$id');
    var headers = {'Content_type': 'application/json'};

    var response = await http.get(url, headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];

      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }
      return products;
    } else {
      throw Exception('gagal get product!');
    }
  }

  Future<List<ProductModel>> getProductsWithsearch({String query}) async {
    var url = Uri.parse('$baseUrl/products?categories');
    var headers = {'Content_type': 'application/json'};

    var response = await http.get(url, headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];

      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }
      if (query != null) {
        products = products
            .where((element) =>
                element.name.toLowerCase().contains((query.toLowerCase())))
            .toList();
      }
      return products;
    } else {
      throw Exception('gagal get product!');
    }
  }
}
