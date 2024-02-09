import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:interview_test/data/models/Article.dart';

class NewsList extends StatelessWidget {
  NewsList({required this.listName, required this.articles});

  String listName;
  List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          listName,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 3.2,
          child: articles.isEmpty
              ? Image.asset(
                  'assets/search-placeholder.png',
                  height: 150,
                )
              : ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        leading: SizedBox(
                          height: 80,
                          width: 80,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: articles[index].urlToImage ?? '',
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error_outline),
                          ),
                        ),
                        title: Text(
                          '${articles[index].title}',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
