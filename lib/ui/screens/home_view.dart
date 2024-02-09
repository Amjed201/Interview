import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_test/controllers/news_controller.dart';
import 'package:interview_test/ui/widgets/news_list_widget.dart';
import 'package:interview_test/ui/widgets/search_field_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final TextEditingController searchTextController1 = TextEditingController();
  final TextEditingController searchTextController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('News'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SearchField(
                    textController: searchTextController1,
                    labelText: 'Search News for List 1',
                    onChanged: (String value) {
                      if (value.length > 2) {
                        Get.find<NewsController>()
                            .fetchNewsBySearch(isFirstList: true, query: value);
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  SearchField(
                    textController: searchTextController2,
                    labelText: 'Search News for List 2',
                    onChanged: (String value) {
                      if (value.length > 2) {
                        Get.find<NewsController>().fetchNewsBySearch(
                            isFirstList: false, query: value);
                      }
                    },
                  ),
                ],
              ),
            ),
            GetBuilder<NewsController>(builder: (controller) {
              return Column(
                children: [
                  controller.loading1
                      ? const SizedBox(
                          height: 200,
                          child: Center(child: CircularProgressIndicator()))
                      : NewsList(
                          listName: 'List 1',
                          articles: controller.articlesList1),
                  const Divider(
                    color: Colors.black,
                  ),
                  controller.loading2
                      ? const SizedBox(
                          height: 200,
                          child: Center(child: CircularProgressIndicator()))
                      : NewsList(
                          listName: 'List 2',
                          articles: controller.articlesList2)
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
