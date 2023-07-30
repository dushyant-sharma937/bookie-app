// ignore_for_file: must_be_immutable

import 'package:bookie/models/book.dart';
import 'package:bookie/widgets/text_widget_home.dart';
import 'package:flutter/material.dart';

// A custom container widget to display review information and book type.
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
            // Display the book rating and the number of reviews in a custom widget.
            ReviewsTray(
              text1:
                  "${currentBook.volumeInfo.rating ?? "N/A"} ★", // Provide fallback value
              text2:
                  "${currentBook.volumeInfo.ratingsCount ?? "0"} Reviews", // Provide fallback value
            ),
            const VerticalDivider(color: Colors.grey, thickness: 2),
            // Display the book type (eBook or Book) along with an icon.
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
                  fsize: 16,
                ),
                const SizedBox(height: 5),
              ],
            ),
            const VerticalDivider(color: Colors.grey, thickness: 2),
            // Display the number of pages in the book.
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

// A custom widget to display review information.
class ReviewsTray extends StatelessWidget {
  const ReviewsTray({
    super.key,
    required this.text1,
    required this.text2,
  });

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Display the first review text (e.g., book rating).
        TextWidget(
          text: text1,
          weight: FontWeight.bold,
          fsize: 16,
        ),
        const SizedBox(height: 5),
        // Display the second review text (e.g., number of reviews).
        TextWidget(
          text: text2,
          fsize: 16,
        ),
      ],
    );
  }
}
