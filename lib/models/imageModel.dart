class ImageModel {
  int id;
  String name;
  String url;
  String description;

  ImageModel({this.id, this.name, this.url, this.description});

  ImageModel.fromJSON(Map<String, dynamic> encodedJSON) {
    id = encodedJSON['id'];
    name = encodedJSON['name'];
    url = encodedJSON['url'];
    description = encodedJSON['description'];
  }
}
