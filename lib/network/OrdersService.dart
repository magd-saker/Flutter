import 'package:syrital/model/orders.dart' show Orders;
import 'api.dart';
import 'dart:convert';

class OrdersService{
  static String baseUrl = "/orders";

  static Future<List<Orders>> getOrders() async {
    final response = await Network().getData(baseUrl);
    List<Orders> list = parseResponse(response.body);
    return list;
  }

  static List<Orders> parseResponse(String responseBody) {
    final Map<String, dynamic> parsed = json.decode(responseBody);

    // Assuming "products" is the key containing the list of products
    final List<dynamic> ordersJson = parsed['orders'];

    return ordersJson.map<Orders>((json) => Orders.fromJson(json)).toList();
  }



}