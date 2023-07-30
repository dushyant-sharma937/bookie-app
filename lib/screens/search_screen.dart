import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';
import '../providers/book_search_provider.dart';
import '../widgets/text_widget_home.dart';
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
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: "Search",
                    icon: Icon(Icons.search),
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
                      return const Center(child: CircularProgressIndicator());
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
                                child: Container(
                                  margin: const EdgeInsets.all(8),
                                  padding: const EdgeInsets.all(4),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 2,
                                      vertical: 1,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                              currentBook.volumeInfo
                                                          .thumbnailLinks?[
                                                      "smallThumbnail"] ??
                                                  'https://www.service95.com/wp-content/themes/service95-new/assets/images/placeholder-image2.png',
                                              // fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextWidget(
                                                text: currentBook
                                                    .volumeInfo.title!,
                                                weight: FontWeight.bold,
                                                fsize: 18,
                                              ),
                                              const SizedBox(height: 5),
                                              TextWidget(
                                                text: currentBook
                                                    .volumeInfo.authors!,
                                                fsize: 16,
                                              ),
                                              const SizedBox(height: 5),
                                              TextWidget(
                                                text: (currentBook
                                                        .saleInfo!.isEbook!)
                                                    ? "eBook   ${currentBook.volumeInfo.rating} ★"
                                                    : "Book   ${currentBook.volumeInfo.rating} ★",
                                                fsize: 14,
                                              ),
                                              const SizedBox(height: 5),
                                              TextWidget(
                                                text: currentBook
                                                    .saleInfo!.saleability!,
                                                fsize: 12,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
