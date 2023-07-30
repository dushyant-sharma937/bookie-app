// ignore_for_file: must_be_immutable

import 'package:bookie/models/book.dart';
import 'package:bookie/widgets/text_widget_home.dart';
import 'package:flutter/material.dart';

class ContainerReviewTray extends StatelessWidget {
  const ContainerReviewTray({
    Key? key,
    required this.currentBook,
  }) : super(key: key);

  final Book currentBook;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ReviewsTray(
              text1:
                  "${currentBook.volumeInfo.rating ?? "N/A"} ★", // Provide fallback value
              text2:
                  "${currentBook.volumeInfo.ratingsCount ?? "0"} Reviews", // Provide fallback value
            ),
            const VerticalDivider(color: Colors.grey, thickness: 2),
            Column(
              children: [
                const Icon(
                  Icons.book_outlined,
                  size: 23,
                ),
                const SizedBox(height: 5),
                TextWidget(
                  text: (currentBook.saleInfo?.isEbook ?? false)
                      ? "eBook"
                      : "Book", // Provide fallback value
                  fsize: 14,
                ),
                const SizedBox(height: 5),
              ],
            ),
            const VerticalDivider(color: Colors.grey, thickness: 2),
            ReviewsTray(
              text1: currentBook.volumeInfo.pageCount ??
                  "N/A", // Provide fallback value
              text2: "Pages",
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewsTray extends StatelessWidget {
  ReviewsTray({
    super.key,
    required this.text1,
    required this.text2,
  });

  String text1;
  String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(
          text: text1,
          weight: FontWeight.w600,
        ),
        const SizedBox(height: 5),
        TextWidget(
          text: text2,
          fsize: 14,
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
