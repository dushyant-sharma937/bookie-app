import 'package:bookie/widgets/text_widget_home.dart';
import 'package:flutter/cupertino.dart';

import '../models/book.dart';

// A custom container widget to display main book details.
class ContainerMain extends StatelessWidget {
  const ContainerMain({
    Key? key,
    required this.currentBook,
  }) : super(key: key);

  final Book currentBook;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display the book thumbnail image with specific dimensions and padding.
          SizedBox(
            height: 180,
            width: 150,
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 8, left: 4, top: 8, bottom: 8),
              child: Image.network(
                currentBook.volumeInfo.thumbnailLinks?["smallThumbnail"] ??
                    'https://www.service95.com/wp-content/themes/service95-new/assets/images/placeholder-image2.png',
                // fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                // Display the book title with specific text styling.
                TextWidget(
                  text: currentBook.volumeInfo.title ?? "N/A",
                  weight: FontWeight.w800,
                  fsize: 22,
                  maxLines: 40,
                ),
                const SizedBox(height: 5),
                // Display the book authors if available, otherwise show an empty string.
                TextWidget(
                  text: currentBook.volumeInfo.authors ?? "N/A",
                  weight: FontWeight.w500,
                  maxLines: 40,
                  fsize: 18,
                ),
                const SizedBox(height: 5),
                // Display the book publisher.
                TextWidget(
                  text: currentBook.volumeInfo.publisher ?? "N/A",
                  fsize: 16,
                ),
                const SizedBox(height: 5),
                // Display the book release date with a prefix.
                TextWidget(
                  text:
                      "Released on ${currentBook.volumeInfo.publishedDate ?? ""}",
                  fsize: 14,
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
