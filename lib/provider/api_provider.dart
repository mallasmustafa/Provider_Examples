import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider_example/model/product_model.dart';

class ApiProvider extends ChangeNotifier {
  bool isLoading = false;
  ApiProvider() {
    getProducts();
  }

  List<ProductModel> products = [];
  String baseUrl = "https://fakestoreapi.com/products";

  Future<void> getProducts() async {
    isLoading = true;
    notifyListeners();
    var response = await http.get(Uri.parse(baseUrl));
    var data = jsonDecode(response.body) as List;
    products =
        data.map((productJson) => ProductModel.fromJson(productJson)).toList();
    notifyListeners();
    print(products.length);
    isLoading = false;
    notifyListeners();
  }
}
