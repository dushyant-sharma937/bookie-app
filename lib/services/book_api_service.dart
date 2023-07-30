import 'dart:convert';
import 'package:bookie/models/book.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/sale_info.dart';
import '../models/volume_info.dart';

// A service class to interact with the Google Books API and fetch book data.
class BookService {
  static const String _baseUrl = 'https://www.googleapis.com/books/v1/volumes';
  // Your API key for accessing the Google Books API.
  // To use the 'dotenv' package to load the API key, set it in a '.env' file.
  // Example: api_key=YOUR_API_KEY
  static final String _apiKey = dotenv.env['api_key']!;

  // Fetches a list of books from the Google Books API based on the provided query.
  Future<List<Book>> searchBooks(String query) async {
    // Send an HTTP GET request to the Google Books API with the query and API key.
    final response =
        await http.get(Uri.parse('$_baseUrl?q=$query&key=$_apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> items = data['items'];
      List<Book> books = [];

      // Loop through the retrieved book data and create Book objects.
      for (var item in items) {
        final Map<String, dynamic> bookDataVolumeInfo = item['volumeInfo'];
        final Map<String, dynamic> bookDataSaleInfo = item['saleInfo'];
        final Book book = Book(
          volumeInfo: VolumeInfo(
            title: bookDataVolumeInfo['title'],
            authors: bookDataVolumeInfo['authors'] != null
                ? List<String>.from(bookDataVolumeInfo['authors']).toString()
                : "Unknown Author",
            thumbnailLinks: bookDataVolumeInfo['imageLinks'] != null
                ? Map<String, String>.from(bookDataVolumeInfo['imageLinks'])
                : {},
            rating: bookDataVolumeInfo['averageRating']?.toString() ?? '0.0',
            description: bookDataVolumeInfo['description']?.toString() ??
                "No description available :(",
            language: bookDataVolumeInfo['language']?.toString() ?? "N/A",
            pageCount: bookDataVolumeInfo['pageCount']?.toString() ?? "N/A",
            publishedDate:
                bookDataVolumeInfo['publishedDate']?.toString() ?? "15-01-2015",
            publisher: bookDataVolumeInfo['publisher']?.toString() ??
                "Unknown publisher",
            ratingsCount: bookDataVolumeInfo['ratingsCount']?.toString() ?? "0",
          ),
          saleInfo: SaleInfo(
            buyLink: bookDataSaleInfo['buyLink']?.toString() ?? "",
            country: bookDataSaleInfo['country']?.toString() ?? "",
            isEbook: bookDataSaleInfo['isEbook'] ?? false,
            saleability: bookDataSaleInfo['saleability']?.toString() ?? "",
          ),
        );
        books.add(book);
      }

      return books;
    } else {
      throw Exception('Failed to load books');
    }
  }
}
