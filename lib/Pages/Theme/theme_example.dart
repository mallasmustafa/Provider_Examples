import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/theme_provider.dart';

class ThemeExample extends StatelessWidget {
  const ThemeExample({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Change theme Example",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<ThemeProvider>(
          builder: (context, value, child) {
            return value.themeMode == ThemeMode.light
                ? IconButton(
                    onPressed: () {
                      themeProvider.changeThemeMode(ThemeMode.dark);
                    },
                    icon: const Icon(
                      Icons.dark_mode,
                      color: Colors.deepPurple,
                      size: 50,
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      themeProvider.changeThemeMode(ThemeMode.light);
                    },
                    icon: const Icon(
                      Icons.light_mode,
                      color: Colors.deepPurple,
                      size: 50,
                    ),
                  );
          },
        ),
      ),
    );
  }
}
