class SaleInfo {
  String? country;
  String? saleability;
  bool? isEbook;
  String? buyLink;

  // Add other properties as needed

  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.buyLink,
  });

  factory SaleInfo.fromMap(Map<String, dynamic> map) {
    return SaleInfo(
      country: map[
          "country"], // Assuming 'authors' is a List<String> in the API response
      saleability: map["saleability"],
      isEbook: map["isEbook"],
      buyLink: map["buyLink"],
    );
  }
}
