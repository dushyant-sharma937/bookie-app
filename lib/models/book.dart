import 'package:bookie/models/sale_info.dart';
import 'package:bookie/models/volume_info.dart';

import 'access_info.dart';

class Book {
  VolumeInfo volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;

  Book({
    required this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
  });
}
