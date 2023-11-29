import 'package:syrital/model/products.dart' show Products;
import 'api.dart';
import 'dart:convert';

class ProductsService{
  static String baseUrl = "/products";

  static Future<List<Products>> getProducts() async {
    final response = await Network().getData(baseUrl);
    List<Products> list = parseResponse(response.body);
    return list;
  }

  static List<Products> parseResponse(String responseBody) {
    final Map<String, dynamic> parsed = json.decode(responseBody);

    // Assuming "products" is the key containing the list of products
    final List<dynamic> productsJson = parsed['products'];

    return productsJson.map<Products>((json) => Products.fromJson(json)).toList();
  }



}