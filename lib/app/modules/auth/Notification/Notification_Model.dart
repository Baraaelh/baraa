class NotificationModel {
  final String title;
  final String body;
  final String time;
  final String? image;

  NotificationModel({
    required this.title,
    required this.body,
    required this.time,
    this.image,
  });
}