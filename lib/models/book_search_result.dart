import 'package:bookie/models/book.dart';

// Represents the result of a book search operation.
class BookSearchResult {
  final List<Book> books;

  // Constructs a [BookSearchResult] object with the given [books].
  BookSearchResult({required this.books});
}
