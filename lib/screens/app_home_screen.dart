import 'package:bookie/providers/book_provider.dart';
import 'package:bookie/screens/search_screen.dart';
import 'package:bookie/widgets/book_overview_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import 'book_detail_screen.dart';

// The home screen of the Bookie app.
class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen({Key? key}) : super(key: key);

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  @override
  Widget build(BuildContext context) {
    BookProvider bookProvider = Provider.of<BookProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bookie"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.search)),
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Text("Rate us :)"),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  // add share button code
                  print("Rate us button is tapped");
                }
              },
            )
          ],
        ),
        body: RefreshIndicator(
          color: Colors.white70,
          onRefresh: () => bookProvider.fetchFavoriteBooks(),
          child: (bookProvider.isLoading == false)
              ? SafeArea(
                  child: Consumer<BookProvider>(
                      builder: (context, bookProvider, _) {
                    final favoriteBooks = bookProvider.favoriteBooks;
                    return ListView(
                      children: [
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisExtent: 240,
                          ),
                          itemCount: favoriteBooks.length,
                          itemBuilder: (context, index) {
                            final currentBook = favoriteBooks[index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => BookDetailScreen(
                                      currentBook: currentBook,
                                    ),
                                  ),
                                );
                              },
                              splashColor: Colors.grey,
                              child: BookOverviewTile(currentBook: currentBook),
                            );
                          },
                        ),
                      ],
                    );
                  }),
                )
              : Center(
                  child: LoadingAnimationWidget.newtonCradle(
                      color: Colors.white, size: 150)),
        ));
  }
}
