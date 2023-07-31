import 'package:flutter/foundation.dart';
import 'package:bookie/models/book.dart';

import '../services/book_api_service.dart';

class BookProvider with ChangeNotifier {
  bool isLoading = true;
  BookProvider() {
    fetchFavoriteBooks();
  }
  final List<String> _favoriteBookIds = [
    "E-OLEAAAQBAJ",
    "-Wd9EAAAQBAJ",
    "buc0AAAAMAAJ",
    "jfSn2RJZI9EC",
    "Ayk3EAAAQBAJ",
    "n7JfDwAAQBAJ",
    "_MO5EAAAQBAJ",
    "Lda5EAAAQBAJ",
    "BsdsDwAAQBAJ",
    "7lLtBgAAQBAJ",
    "5ygaCgAAQBAJ",
    "cc-5EAAAQBAJ",
    "d0i5EAAAQBAJ",
    "ePtzCAAAQBAJ",
    "bMjjDwAAQBAJ",
    "UumoEAAAQBAJ",
    "ouG9EAAAQBAJ",
    "IlKUEAAAQBAJ",
    "OG2qEAAAQBAJ",
    "Jx-UEAAAQBAJ",
    "ffShEAAAQBAJ",
    "m1SBEAAAQBAJ",
  ];
  List<Book> _favoriteBooks = [];
  List<Book> get favoriteBooks => _favoriteBooks;

  Future<void> fetchFavoriteBooks() async {
    List<Book> favoriteBooks = [];
    for (String bookId in _favoriteBookIds) {
      final book = await BookService().fetchBooksByIds(bookId);
      favoriteBooks.add(book);
    }
    _favoriteBooks = favoriteBooks;
    isLoading = false;
    notifyListeners();
  }
}
