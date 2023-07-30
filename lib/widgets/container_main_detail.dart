import 'package:bookie/widgets/text_widget_home.dart';
import 'package:flutter/cupertino.dart';

import '../models/book.dart';

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
          SizedBox(
            height: 200,
            width: 150,
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 8, left: 4, top: 8, bottom: 8),
              child: Image.network(
                currentBook.volumeInfo.thumbnailLinks?["smallThumbnail"] ??
                    'https://www.service95.com/wp-content/themes/service95-new/assets/images/placeholder-image2.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                TextWidget(
                  text: currentBook.volumeInfo.title ?? "",
                  weight: FontWeight.w800,
                  fsize: 22,
                ),
                const SizedBox(height: 5),
                TextWidget(
                  text: currentBook.volumeInfo.authors ?? "",
                  // Display the authors if available, otherwise show an empty string
                  weight: FontWeight.w500,
                ),
                const SizedBox(height: 5),
                TextWidget(text: currentBook.volumeInfo.publisher ?? ""),
                const SizedBox(height: 5),
                TextWidget(
                  text:
                      "Released on ${currentBook.volumeInfo.publishedDate ?? ""}",
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
