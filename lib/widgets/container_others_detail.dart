import 'package:bookie/models/book.dart';
import 'package:bookie/widgets/text_widget_home.dart';
import 'package:flutter/material.dart';

// A custom container widget to display additional book details.
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
          // Display the book language with specific text styling.
          TextWidget(text: "Language", weight: FontWeight.w800),
          const SizedBox(height: 5),
          TextWidget(
              text: currentBook.volumeInfo.language ?? "N/A",
              fsize: 14), // Provide fallback value
          const SizedBox(height: 20),
          // Display the book author(s) with specific text styling.
          TextWidget(text: "Author(s)", weight: FontWeight.w800),
          const SizedBox(height: 5),
          TextWidget(
              text: currentBook.volumeInfo.authors ?? "N/A",
              fsize: 14), // Provide fallback value
          const SizedBox(height: 20),
          // Display the book publisher with specific text styling.
          TextWidget(text: "Publisher", weight: FontWeight.w800),
          const SizedBox(height: 5),
          TextWidget(
              text: currentBook.volumeInfo.publisher ?? "N/A",
              fsize: 14), // Provide fallback value
          const SizedBox(height: 20),
          // Display the book's published date with specific text styling.
          TextWidget(text: "Published on", weight: FontWeight.w800),
          const SizedBox(height: 5),
          TextWidget(
              text: currentBook.volumeInfo.publishedDate ?? "",
              fsize: 14), // Provide fallback value
          const SizedBox(height: 20),
          // Display the country where the book is available with specific text styling.
          TextWidget(text: "Available in", weight: FontWeight.w800),
          const SizedBox(height: 5),
          TextWidget(
              text: currentBook.saleInfo!.country ?? "N/A",
              fsize: 14), // Provide fallback value
          const SizedBox(height: 20),
          // Display the number of pages in the book with specific text styling.
          TextWidget(text: "Pages", weight: FontWeight.w800),
          const SizedBox(height: 5),
          TextWidget(
              text: currentBook.volumeInfo.pageCount ?? "N/A",
              fsize: 14), // Provide fallback value
        ],
      ),
    );
  }
}
