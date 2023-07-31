import 'package:bookie/widgets/text_widget_home.dart';
import 'package:flutter/material.dart';

import '../models/book.dart';

class BookOverviewTile extends StatelessWidget {
  const BookOverviewTile({
    super.key,
    required this.currentBook,
  });

  final Book currentBook;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 2,
          vertical: 1,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 150,
              height: 200,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                  left: 4,
                ),
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
                  TextWidget(
                    text: currentBook.volumeInfo.title!,
                    weight: FontWeight.bold,
                    fsize: 18,
                  ),
                  const SizedBox(height: 5),
                  TextWidget(
                    text: currentBook.volumeInfo.authors!,
                    fsize: 16,
                  ),
                  const SizedBox(height: 5),
                  TextWidget(
                    text: (currentBook.saleInfo!.isEbook!)
                        ? "eBook   ${currentBook.volumeInfo.rating} ★"
                        : "Book   ${currentBook.volumeInfo.rating} ★",
                    fsize: 14,
                  ),
                  const SizedBox(height: 5),
                  TextWidget(
                    text: currentBook.saleInfo!.saleability!,
                    fsize: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
