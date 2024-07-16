import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/Pages/Api/product_detail.dart';
import 'package:provider_example/provider/api_provider.dart';

class GetApiCalling extends StatelessWidget {
  const GetApiCalling({super.key});

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Get Api Calling",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
        ),
        body: Consumer<ApiProvider>(
          builder: (context, value, child) => value.isLoading
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: value.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(
                            ProductDetail(productModel: value.products[index]));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Image.network(
                                value.products[index].image ?? "",
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Text(
                                    maxLines: 1,
                                    value.products[index].title ?? "",
                                  ),
                                  Text(
                                    "${value.products[index].price ?? "0"}",
                                  ),
                                  Text(
                                    value.products[index].category.toString(),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ));
  }
}
