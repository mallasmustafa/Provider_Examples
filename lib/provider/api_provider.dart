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

  Future<void> addProducts(
      String title, double price, String description, String category) async {
    try {
      var newProduct = ProductModel(
        // id: products.length + 1,
        title: title,
        price: price,
        description: description,
        image: "https://i.pravatar.cc",
        category: category,
      );
      var response = await http.post(
        Uri.parse(baseUrl),
        body: jsonEncode(
          newProduct.toJson(),
        ),
        headers: {"Content-Type": "application/json"},
      );
      print('Response body: ${response.body}');
      print('Response status: ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Product added successfully");
        title = "";
        price = 0;
        description = "";
        category = "";
        await getProducts();
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}
