import 'package:flutter/material.dart';
import 'package:smart_home/utils/app_text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Home screen",
          style: AppTextStyle.urbanistW900,
        ),
      ),
    );
  }
}
