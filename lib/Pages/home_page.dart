import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_example/Pages/counter_page.dart';
import 'package:provider_example/Pages/slider_example.dart';
import 'package:provider_example/Pages/theme_example.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}
