import 'dart:convert';
import 'package:bookie/models/book.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/sale_info.dart';
import '../models/volume_info.dart';

// import '../admin/config.dart';

class BookService {
  static const String _baseUrl = 'https://www.googleapis.com/books/v1/volumes';
  // static final String _apiKey = Config().gbook_api_key;
  static final String _apiKey = dotenv.env['api_key']!;

  Future<List<Book>> searchBooks(String query) async {
    final response =
        await http.get(Uri.parse('$_baseUrl?q=$query&key=$_apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> items = data['items'];
      List<Book> books = [];

      for (var item in items) {
        final Map<String, dynamic> bookDataVolumeInfo =
            item['volumeInfo']; // Access volumeInfo directly
        final Map<String, dynamic> bookDataSaleInfo =
            item['saleInfo']; // Access SaleInfo directly
        final Book book = Book(
          volumeInfo: VolumeInfo(
            title: bookDataVolumeInfo['title'],
            authors: bookDataVolumeInfo['authors'] != null
                ? List<String>.from(bookDataVolumeInfo['authors']).toString()
                : "",
            thumbnailLinks: bookDataVolumeInfo['imageLinks'] != null
                ? Map<String, String>.from(bookDataVolumeInfo['imageLinks'])
                : {},
            rating: bookDataVolumeInfo['averageRating']?.toString() ?? '0.0',
            description: bookDataVolumeInfo['description']?.toString() ??
                "No description avilable :(",
            language: bookDataVolumeInfo['language']?.toString() ?? "N/A",
            pageCount: bookDataVolumeInfo['pageCount']?.toString() ?? "N/A",
            publishedDate:
                bookDataVolumeInfo['publishedDate']?.toString() ?? "",
            publisher: bookDataVolumeInfo['publisher']?.toString() ?? "",
            ratingsCount:
                bookDataVolumeInfo['ratingsCount']?.toString() ?? "N/A",
          ),
          saleInfo: SaleInfo(
            buyLink: bookDataSaleInfo['buyLink']?.toString() ?? "",
            country: bookDataSaleInfo['country']?.toString() ?? "",
            isEbook: bookDataSaleInfo['isEbook'] ?? false,
            saleability: bookDataSaleInfo['saleability']?.toString() ?? "",
          ), // Use 'item' to access accessInfo
        );
        books.add(book);
      }

      return books;
    } else {
      throw Exception('Failed to load books');
    }
  }
}
