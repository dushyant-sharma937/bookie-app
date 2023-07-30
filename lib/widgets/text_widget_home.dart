// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String text;
  FontWeight? weight;
  double? fsize;
  int? maxLines;

  TextWidget(
      {super.key,
      required this.text,
      this.weight,
      this.fsize = 16,
      this.maxLines = 2});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.6,
      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: weight,
          fontSize: fsize,
        ),
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
