import 'package:bookie/models/sale_info.dart';
import 'package:bookie/models/volume_info.dart';
import 'access_info.dart';

// Represents a book object with its related information.
class Book {
  VolumeInfo volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;

  // Creates a [Book] object with the given [volumeInfo], [saleInfo], and [accessInfo].
  Book({
    required this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
  });
}
