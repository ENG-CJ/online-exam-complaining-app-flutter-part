class MyComplain {
  String comId;
  String subjects;
  String description;
  DateTime date;
  String status;

  MyComplain({
    required this.comId,
    required this.subjects,
    required this.description,
    required this.date,
    required this.status,
  });

  factory MyComplain.fromJson(Map<String, dynamic> json) => MyComplain(
    comId: json["com_id"],
    subjects: json["subjects"],
    description: json["description"],
    date: DateTime.parse(json["date"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "com_id": comId,
    "subjects": subjects,
    "description": description,
    "date": date.toIso8601String(),
    "status": status,
  };
}