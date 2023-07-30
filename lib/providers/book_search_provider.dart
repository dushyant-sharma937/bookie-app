import 'package:flutter/cupertino.dart';

import '../models/book.dart';
import '../models/book_search_result.dart';
import '../services/book_api_service.dart';

class BookSearchProvider extends ChangeNotifier {
  final _bookService = BookService();
  BookSearchResult _searchResult = BookSearchResult(books: []);
  bool _isLoading = false;
  bool _hasError = false;
  String _errorMessage = '';

  BookSearchResult get searchResult => _searchResult;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get errorMessage => _errorMessage;

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

  void resetSearch() {
    _searchResult = BookSearchResult(books: []);
    _isLoading = false;
    _hasError = false;
    _errorMessage = '';
    notifyListeners();
  }
}
