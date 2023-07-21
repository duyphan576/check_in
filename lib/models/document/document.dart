class Document {
  int? id;
  int? classroomId;
  String? part;
  String? fileName;
  String? url;

  Document({this.id, this.classroomId, this.fileName, this.part, this.url});

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: int.parse(json['id'].toString()),
      fileName: json['fileName'].toString(),
      part: json['part'].toString(),
      url: json['url'].toString(),
    );
  }
}
