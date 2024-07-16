import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/slider_provider.dart';

class SliderExample extends StatelessWidget {
  const SliderExample({super.key});

  @override
  Widget build(BuildContext context) {
    SliderProvider sliderProvider =
        Provider.of<SliderProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Slider Example",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Slider(
                value: value.sliderValue,
                onChanged: (value) {
                  sliderProvider.changeSliderValue(value);
                },
                min: 0,
                max: 100,
              );
            },
          ),
          const SizedBox(height: 20),
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Text(
                "Slider Value: ${value.sliderValue}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
