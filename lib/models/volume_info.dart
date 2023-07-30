class VolumeInfo {
  String? title;
  String? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  String? rating;
  String? ratingsCount;
  String? pageCount;
  String? language;
  Map<String, String>? thumbnailLinks;
  Map<String, String>? imageLinks;

  // Represents the volume information of a book.
  VolumeInfo({
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.rating,
    this.ratingsCount,
    this.pageCount,
    this.language,
    this.thumbnailLinks,
    this.imageLinks,
  });

  // Creates a [VolumeInfo] object from a JSON [map].
  factory VolumeInfo.fromMap(Map<String, dynamic> map) {
    return VolumeInfo(
      title: map["title"],
      authors: map["authors"]?.join(", "),
      publisher: map["publisher"],
      publishedDate: map["publishedDate"],
      description: map["description"],
      rating: map["averageRating"].toString(),
      ratingsCount: map["ratingsCount"].toString(),
      pageCount: map["pageCount"].toString(),
      language: map["language"],
      thumbnailLinks: Map<String, String>.from(map["thumbnailLinks"] ?? {}),
      imageLinks: Map<String, String>.from(map["imageLinks"] ?? {}),
      // Map other properties as needed
    );
  }
}
