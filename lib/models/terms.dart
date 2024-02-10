class Terms {
  String termId;
  String subjectLength;
  DateTime startDate;
  DateTime expireDate;
  String description;
  String status;
  String examType;
  DateTime createdAt;

  Terms({
    required this.termId,
    required this.subjectLength,
    required this.startDate,
    required this.expireDate,
    required this.description,
    required this.status,
    required this.examType,
    required this.createdAt,
  });

  factory Terms.fromJson(Map<String, dynamic> json) => Terms(
    termId: json["term_id"],
    subjectLength: json["subject_length"],
    startDate: DateTime.parse(json["start_date"]),
    expireDate: DateTime.parse(json["expire_date"]),
    description: json["description"],
    status: json["status"],
    examType: json["exam_type"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "term_id": termId,
    "subject_length": subjectLength,
    "start_date": startDate,
    "expire_date": expireDate,
    "description": description,
    "status": status,
    "exam_type": examType,
    "created_at": createdAt.toIso8601String(),
  };
}