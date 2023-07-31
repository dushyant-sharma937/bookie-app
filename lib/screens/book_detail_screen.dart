// ignore_for_file: must_be_immutable

import 'package:bookie/widgets/text_widget_home.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/book.dart';
import '../widgets/container_others_detail.dart';
import '../widgets/container_about_section_detail.dart';
import '../widgets/container_main_detail.dart';
import '../widgets/container_review_tray.dart';

/// A screen that displays detailed information about a book.
class BookDetailScreen extends StatelessWidget {
  final Book currentBook;

  const BookDetailScreen({Key? key, required this.currentBook})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    String buyLink = currentBook.saleInfo?.buyLink ?? '';
    // Remove the "&source=gbs_api" part from the buyLink if it exists
    buyLink = buyLink.replaceAll('&source=gbs_api', '');
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.search),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_add_outlined),
          ),
          const SizedBox(width: 8),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text("Share"),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                // Add share button code here
                print("Share button is tapped");
              }
            },
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContainerMain(currentBook: currentBook),
                  const CustomSpacer(),
                  ContainerReviewTray(currentBook: currentBook),
                  const CustomSpacer(),
                  GetButton(currentBook: currentBook, buyLink: buyLink),
                  const Divider(color: Colors.grey, thickness: 2),
                  ContainerAboutSection(currentBook: currentBook),
                  const Divider(color: Colors.grey, thickness: 2),
                  ContainerOthers(currentBook: currentBook)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// A button that allows users to get or buy a book.
class GetButton extends StatelessWidget {
  final Book currentBook;
  final String buyLink;

  const GetButton({Key? key, required this.currentBook, required this.buyLink})
      : super(key: key);

  void launchURL(String url) async {
    Uri? uri = Uri.tryParse(url);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: () {
          if (buyLink.isNotEmpty) {
            final Uri uri = Uri.parse(buyLink);
            launchUrl(uri);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("The book is not available for free!"),
              backgroundColor: Colors.red,
            ));
          }
        },
        color: Colors.blue,
        minWidth: MediaQuery.of(context).size.width * 0.9,
        child: TextWidget(
          text: (currentBook.saleInfo!.saleability == "FREE")
              ? "Get for free"
              : "Buy it",
          fsize: 18,
          weight: FontWeight.w500,
        ),
      ),
    );
  }
}

// A custom-sized vertical spacer widget.
class CustomSpacer extends SizedBox {
  const CustomSpacer({super.key}) : super(height: 2);
}
