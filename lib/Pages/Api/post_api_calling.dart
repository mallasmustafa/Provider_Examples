import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/widget/my_textform_field.dart';

import '../../provider/api_provider.dart';

class PostApiCalling extends StatelessWidget {
  const PostApiCalling({super.key});

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context);
    TextEditingController title = TextEditingController();
    TextEditingController price = TextEditingController();
    TextEditingController description = TextEditingController();
    TextEditingController category = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Api Calling"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  "Add Product",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            MyTextFormField(
              controller: title,
              hintText: "Enter product title",
            ),
            const SizedBox(height: 10),
            MyTextFormField(
              controller: price,
              hintText: "Enter product price",
            ),
            const SizedBox(height: 10),
            MyTextFormField(
              controller: description,
              hintText: "Enter product description",
              isDescription: true,
            ),
            const SizedBox(height: 10),
            MyTextFormField(
              controller: category,
              hintText: "Enter product category",
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: () {
                apiProvider.addProducts(
                  title.text,
                  double.parse(price.text),
                  description.text,
                  category.text,
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurple,
                ),
                child: const Center(
                  child: Text(
                    "Add Product",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
