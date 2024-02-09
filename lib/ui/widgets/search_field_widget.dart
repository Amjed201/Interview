import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  SearchField({required this.textController, this.labelText = ''});

  TextEditingController textController;
  String labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      onChanged: (value) {},
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
