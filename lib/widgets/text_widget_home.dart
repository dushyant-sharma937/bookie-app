// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

// A custom widget to display text with optional text style and line count.
class TextWidget extends StatelessWidget {
  String text;
  FontWeight? weight;
  double? fsize;
  int? maxLines;

  TextWidget({
    super.key,
    required this.text,
    this.weight,
    this.fsize = 16,
    this.maxLines = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontWeight: weight,
        fontSize: fsize,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
