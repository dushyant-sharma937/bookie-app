// ignore_for_file: must_be_immutable

import 'package:bookie/widgets/text_widget_home.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/book.dart';
import '../widgets/container_others_detail.dart';
import '../widgets/container_about_section_detail.dart';
import '../widgets/container_main_detail.dart';
import '../widgets/container_review_tray.dart';

class BookDetailScreen extends StatelessWidget {
  Book currentBook;
  BookDetailScreen({super.key, required this.currentBook});

  @override
  Widget build(BuildContext context) {
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
                // add share button code
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
                  GetButton(currentBook: currentBook),
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

class GetButton extends StatelessWidget {
  const GetButton({
    super.key,
    required this.currentBook,
  });

  final Book currentBook;

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
          if (currentBook.accessInfo?.downloadLink != null) {
            launchURL(currentBook.accessInfo!.downloadLink!);
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
          text: (currentBook.saleInfo!.saleability! == "FREE")
              ? "Get for free"
              : "Buy it",
          weight: FontWeight.w500,
        ),
      ),
    );
  }
}

class CustomSpacer extends SizedBox {
  const CustomSpacer({super.key}) : super(height: 5);
}
