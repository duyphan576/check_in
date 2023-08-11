class NotificationModel {
  String? id;
  String? type;
  String? idNotification;
  String? title;
  String? body;
  String? time;
  String? status;

  NotificationModel({
    this.id,
    this.type,
    this.idNotification,
    this.title,
    this.body,
    this.time,
    this.status,
  });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json["id"].toString();
    type = json["type_notification"].toString();
    idNotification = json["idNotification"].toString();
    title = json["title"].toString();
    body = json["body"].toString();
    time = json["time"].toString();
    status = json["status"].toString();
  }
}
