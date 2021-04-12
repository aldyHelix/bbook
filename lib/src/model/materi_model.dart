class Materi {
  String materiName;
  String header;
  String imageUrl;

  Materi({this.materiName, this.header, this.imageUrl});

  @override
  String toString() {
    return 'Materi{materiName: $materiName, header: $header, imageUrl: $imageUrl}';
  }

  factory Materi.fromJson(Map<String, dynamic> json) {
    return Materi(
        materiName: json["materi_name"],
        header: json["header"],
        imageUrl: json["image_url"]);
  }
}
