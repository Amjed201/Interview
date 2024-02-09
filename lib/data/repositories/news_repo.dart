import 'package:get/get.dart';
import 'package:interview_test/data/api/api_client.dart';
import 'package:http/http.dart' as http;

class NewsRepo {
  final apiClient = Get.find<ApiClient>();

  Future<http.Response> fetchNews(String query) async {
    return await apiClient
        .get('/everything?q=$query&apiKey=${ApiClient.API_KEY}');
  }
}
