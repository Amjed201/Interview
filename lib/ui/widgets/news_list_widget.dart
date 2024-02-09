import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  NewsList({required this.listName, required this.items});

  String listName;
  List items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          listName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 3.2,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('${items[index]}'),
              );
            },
          ),
        ),
      ],
    );
  }
}
