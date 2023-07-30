class SaleInfo {
  String? country;
  String? saleability;
  bool? isEbook;
  String? buyLink;

  // Represents the sale information of a book.
  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.buyLink,
  });

  // Creates a [SaleInfo] object from a JSON [map].
  factory SaleInfo.fromMap(Map<String, dynamic> map) {
    return SaleInfo(
      // 'authors' is a List<String> in the API response
      country: map["country"],
      saleability: map["saleability"],
      isEbook: map["isEbook"],
      buyLink: map["buyLink"],
    );
  }
}
