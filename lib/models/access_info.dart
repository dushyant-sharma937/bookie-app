class AccessInfo {
  bool? isPdf;
  String? downloadLink;
  String? webReaderLink;

  AccessInfo({
    this.isPdf,
    this.downloadLink,
    this.webReaderLink,
  });

  factory AccessInfo.fromMap(Map<String, dynamic> map) {
    if (map["pdf"] != null && map["pdf"]["isAvailable"] == true) {
      return AccessInfo(
        isPdf: true,
        downloadLink: map["pdf"]["downloadLink"] as String?,
        webReaderLink: map["webReaderLink"] as String?,
      );
    } else {
      return AccessInfo(
        isPdf: false,
        downloadLink: null,
        webReaderLink: map["webReaderLink"] as String?,
      );
    }
  }
}
