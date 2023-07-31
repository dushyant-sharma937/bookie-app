import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';
import '../providers/book_search_provider.dart';
import '../widgets/book_overview_tile.dart';
import 'book_detail_screen.dart';

// A screen that allows users to search for books.
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<BookSearchProvider>(context, listen: false).resetSearch();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bookie"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  focusNode: _focusNode,
                  cursorColor: Colors.white,
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: "Search",
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  onSubmitted: (value) {
                    Provider.of<BookSearchProvider>(context, listen: false)
                        .searchBooks(value.trim());
                  },
                ),
              ),
              Expanded(
                child: Consumer<BookSearchProvider>(
                  builder: (context, bookSearchProvider, _) {
                    if (bookSearchProvider.isLoading) {
                      return Center(
                          child: LoadingAnimationWidget.newtonCradle(
                              color: Colors.white, size: 150));
                    } else if (bookSearchProvider.hasError) {
                      return Text('Error: ${bookSearchProvider.errorMessage}');
                    } else {
                      List<Book> searchResults =
                          bookSearchProvider.searchResult.books;
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
                            itemCount: searchResults.length,
                            itemBuilder: (context, index) {
                              Book currentBook = searchResults[index];
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
                                child:
                                    BookOverviewTile(currentBook: currentBook),
                              );
                            },
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
