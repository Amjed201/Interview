import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_test/controllers/news_controller.dart';
import 'package:interview_test/data/api/api_client.dart';
import 'package:interview_test/data/repositories/news_repo.dart';

import 'ui/screens/home_view.dart';

void main() {
  Get.put(ApiClient());
  Get.put(NewsRepo());
  Get.put(NewsController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        primaryColor: const Color(0xff3F3D56),
        useMaterial3: false,
      ),
      home: HomeView(),
    );
  }
}

