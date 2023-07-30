import 'package:flutter/cupertino.dart';

import '../models/book.dart';
import '../models/book_search_result.dart';
import '../services/book_api_service.dart';

// A provider class that handles book search operations.
class BookSearchProvider extends ChangeNotifier {
  final _bookService = BookService();
  BookSearchResult _searchResult = BookSearchResult(books: []);
  bool _isLoading = false;
  bool _hasError = false;
  String _errorMessage = '';

  // The current search result containing a list of books.
  BookSearchResult get searchResult => _searchResult;

  // Indicates whether the search operation is in progress.
  bool get isLoading => _isLoading;

  // Indicates whether an error occurred during the search operation.
  bool get hasError => _hasError;

  // The error message, if any, encountered during the search operation.
  String get errorMessage => _errorMessage;

  // Searches for books based on the provided [query].
  Future<void> searchBooks(String query) async {
    if (query.isNotEmpty) {
      _isLoading = true;
      _hasError = false;
      notifyListeners();

      try {
        final volumes = await _bookService.searchBooks(query);
        final books = volumes.map((volume) {
          return Book(
            volumeInfo: volume.volumeInfo,
            saleInfo: volume.saleInfo,
            accessInfo: volume.accessInfo,
          );
        }).toList();
        _searchResult = BookSearchResult(books: books);
      } catch (e) {
        _hasError = true;
        _errorMessage = 'Error: $e';
        _searchResult = BookSearchResult(books: []);
        print('Error: $e');
      } finally {
        _isLoading = false;
        notifyListeners();
      }
    } else {
      _searchResult = BookSearchResult(books: []);
      _hasError = false;
      _errorMessage = '';
      notifyListeners();
    }
  }

  // Resets the search result and related state variables.
  void resetSearch() {
    _searchResult = BookSearchResult(books: []);
    _isLoading = false;
    _hasError = false;
    _errorMessage = '';
    notifyListeners();
  }
}
