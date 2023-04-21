import 'package:env_banner/env_banner.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EnvBanner(
        primary: 'DEV',
        secondary: '1.0.0',
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EnvBanner Demo Home Page')),
      body: Center(
        child: EnvBanner(
          ignoreMediaPadding: true,
          primary: 'Other label',
          location: EnvBannerLocation.bottomStart,
          child: Container(
            color: Colors.grey,
            padding: const EdgeInsets.all(100),
            child: const Text('EnvBanner as Widget Decoration'),
          ),
        ),
      ),
    );
  }
}
