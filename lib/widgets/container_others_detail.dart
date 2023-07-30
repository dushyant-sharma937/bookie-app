import 'package:bookie/models/book.dart';
import 'package:bookie/widgets/text_widget_home.dart';
import 'package:flutter/material.dart';

class ContainerOthers extends StatelessWidget {
  const ContainerOthers({
    Key? key,
    required this.currentBook,
  }) : super(key: key);

  final Book currentBook;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(text: "Language", weight: FontWeight.w600),
          TextWidget(
              text: currentBook.volumeInfo.language ??
                  ""), // Provide fallback value
          const SizedBox(height: 10),
          TextWidget(text: "Author(s)", weight: FontWeight.w600),
          TextWidget(
              text: currentBook.volumeInfo.authors ??
                  ""), // Provide fallback value
          const SizedBox(height: 10),
          TextWidget(text: "Publisher", weight: FontWeight.w600),
          TextWidget(
              text: currentBook.volumeInfo.publisher ??
                  ""), // Provide fallback value
          const SizedBox(height: 10),
          TextWidget(text: "Published on", weight: FontWeight.w600),
          TextWidget(
              text: currentBook.volumeInfo.publishedDate ??
                  ""), // Provide fallback value
          const SizedBox(height: 10),
          TextWidget(text: "Availabe in", weight: FontWeight.w600),
          TextWidget(
              text: currentBook.saleInfo!.country ??
                  ""), // Provide fallback value
          const SizedBox(height: 10),
          TextWidget(text: "Pages", weight: FontWeight.w600),
          TextWidget(
              text: currentBook.volumeInfo.pageCount ??
                  "N/A"), // Provide fallback value
        ],
      ),
    );
  }
}
