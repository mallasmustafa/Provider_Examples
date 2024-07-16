import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_example/Pages/Api/get_api_calling.dart';
import 'package:provider_example/Pages/counter/counter_page.dart';
import 'package:provider_example/Pages/Slider/slider_example.dart';
import 'package:provider_example/Pages/Theme/theme_example.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Icon(
                Icons.heart_broken,
                size: 50,
              ),
              const Text(
                "Provider Example",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              const Row(
                children: [
                  Text("Basic"),
                ],
              ),
              const SizedBox(height: 10),
              ListTile(
                onTap: () {
                  Get.to(const CounterPage());
                },
                title: const Text("counter"),
                leading: const Icon(Icons.numbers),
                tileColor: Colors.white,
                splashColor: Colors.deepPurple,
              ),
              const SizedBox(height: 10),
              ListTile(
                onTap: () {
                  Get.to(const SliderExample());
                },
                title: const Text("slider"),
                leading: const Icon(Icons.rectangle),
                tileColor: Colors.white,
                splashColor: Colors.deepPurple,
              ),
              const SizedBox(height: 10),
              ListTile(
                onTap: () {
                  Get.to(const ThemeExample());
                },
                title: const Text("Theme"),
                leading: const Icon(Icons.palette),
                tileColor: Colors.white,
                splashColor: Colors.deepPurple,
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Text("API with provider"),
                ],
              ),
              const SizedBox(height: 10),
              ListTile(
                onTap: () {
                  Get.to(const GetApiCalling());
                },
                title: const Text("Api Calling (Get)"),
                leading: const Icon(Icons.api),
                tileColor: Colors.white,
                splashColor: Colors.deepPurple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
