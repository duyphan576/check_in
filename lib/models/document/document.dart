class Document {
  int? id;
  String? fileName;
  String? path;
  String? url;

  Document({
    this.id,
    this.fileName,
    this.path,
    this.url,
  });

  Document.fromJson(Map<String, dynamic> json) {
    id = int.parse(json["id"].toString());
    fileName = json["fileName"];
    path = json["path"];
    url = json["url"];
  }
}
