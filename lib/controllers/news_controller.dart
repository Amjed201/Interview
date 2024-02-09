import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:interview_test/data/models/Article.dart';
import 'package:interview_test/data/models/Article.dart';
import 'package:interview_test/data/repositories/news_repo.dart';

class NewsController extends GetxController {
  final newsRepo = Get.find<NewsRepo>();

  bool _loading1 = false;

  bool get loading1 => _loading1;

  List<Article> _articlesList1 = [];

  List<Article> get articlesList1 => _articlesList1;

  bool _loading2 = false;

  bool get loading2 => _loading2;

  List<Article> _articlesList2 = [];

  List<Article> get articlesList2 => _articlesList2;

  Future<void> fetchNewsBySearch(
      {required bool isFirstList, required String query}) async {
    isFirstList ? _loading1 = true : _loading2 = true;
    update();
    http.Response response =
        await newsRepo.fetchNews(query);
    try {
      Map responseMap = json.decode(response.body);
      String status = responseMap['status'];
      if (response.statusCode == 200 && status == 'ok') {
        isFirstList ? _articlesList1 = [] : _articlesList2 = [];
        responseMap['articles'].forEach((v) {
          Article article = Article.fromJson(v);
          isFirstList
              ? _articlesList1.add(article)
              : _articlesList2.add(article);
        });
        Get.showSnackbar(
            const GetSnackBar(message: 'Articles Fetched successfully',duration: Duration(seconds: 2),));
      }
    } catch (e) {
      Get.showSnackbar(
          GetSnackBar(backgroundColor: Colors.red, message: e.toString()));
    } finally {
      isFirstList ? _loading1 = false : _loading2 = false;
      update();
    }
  }
}
