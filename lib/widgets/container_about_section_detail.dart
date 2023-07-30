import 'package:bookie/widgets/text_widget_home.dart';
import 'package:flutter/material.dart';

import '../models/book.dart';

// A custom container widget to display information about the eBook.
class ContainerAboutSection extends StatelessWidget {
  const ContainerAboutSection({
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
          // Display the title "About this eBook" with specific text styling.
          TextWidget(
            text: "About this eBook",
            weight: FontWeight.w600,
            fsize: 18,
          ),
          const SizedBox(height: 5),
          // Display the description of the current eBook.
          // If the description is not available, provide an empty string as a fallback.
          TextWidget(
            text: currentBook.volumeInfo.description ?? "",
            weight: FontWeight.w400,
            fsize: 14,
            maxLines: 1000,
          ),
        ],
      ),
    );
  }
}
