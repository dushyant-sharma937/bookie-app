import 'package:bookie/widgets/text_widget_home.dart';
import 'package:flutter/material.dart';

import '../models/book.dart';

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
          TextWidget(
            text: "About this eBook",
            weight: FontWeight.w600,
            fsize: 18,
          ),
          const SizedBox(height: 5),
          TextWidget(
            text: currentBook.volumeInfo.description ??
                "", // Provide fallback value
            maxLines: 1000,
            weight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
