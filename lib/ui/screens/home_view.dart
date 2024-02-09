import 'package:flutter/material.dart';
import 'package:interview_test/ui/widgets/news_list_widget.dart';
import 'package:interview_test/ui/widgets/search_field_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final TextEditingController searchTextController1 = TextEditingController();
  final TextEditingController searchTextController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
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
                      labelText: 'Search Item for List 1'),
                  const SizedBox(height: 10),
                  SearchField(
                      textController: searchTextController2,
                      labelText: 'Search Item for List 2'),
                ],
              ),
            ),
            Column(
              children: [
                NewsList(listName: 'List 1', items: ['1', '2', '3']),
                const Divider(
                  color: Colors.black,
                ),
                NewsList(listName: 'List 2', items: ['1', '2', '3'])
              ],
            ),
          ],
        ),
      ),
    );
  }
}
