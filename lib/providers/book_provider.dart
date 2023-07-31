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
    "buc0AAAAMAAJ",
    "-Wd9EAAAQBAJ",
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

  bool isBookmarked(String bookId) {
    return _favoriteBookIds.contains(bookId);
  }

  void addBookmarkedBook(Book book) {
    if (!isBookmarked(book.volumeInfo.id.toString())) {
      _favoriteBookIds.add(book.volumeInfo.id.toString());
      _favoriteBooks.insert(0, book);
      notifyListeners();
    }
  }

  void removeBookmarkedBook(String bookId) {
    if (isBookmarked(bookId)) {
      _favoriteBookIds.remove(bookId);
      _favoriteBooks.removeWhere((book) => book.volumeInfo.id == bookId);
      notifyListeners();
    }
  }

  Future<void> fetchFavoriteBooks() async {
    List<Book> favoriteBooks = [];
    for (String bookId in _favoriteBookIds) {
      try {
        final book = await BookService().fetchBooksByIds(bookId);
        favoriteBooks.add(book);
      } catch (e) {
        // Handle the error if a book fails to load
        print('Error loading book with ID $bookId: $e');
      }
    }
    _favoriteBooks = favoriteBooks;
    isLoading = false;
    notifyListeners();
  }
}
