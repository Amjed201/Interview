import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  SearchField({
    required this.textController,
    required this.onChanged,
    this.labelText = '',
  });

  TextEditingController textController;
  String labelText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
