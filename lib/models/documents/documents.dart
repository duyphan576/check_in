class Documents {
  int? id;
  String? fileName;
  String? path;
  String? url;

  Documents({
    this.id,
    this.fileName,
    this.path,
    this.url,
  });

  Documents.fromJson(Map<String, dynamic> json) {
    id = int.parse(json["id"].toString());
    fileName = json["fileName"];
    path = json["path"];
    url = json["url"];
  }
}
