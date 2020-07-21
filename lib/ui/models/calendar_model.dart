import 'dart:convert';

Calendar calendarFromJson(String str) => Calendar.fromJson(json.decode(str));

String calendarToJson(Calendar data) => json.encode(data.toJson());

class Calendar {
  Calendar({
    this.id,
    this.date,
    this.description,
  });

  String id;
  DateTime date;
  String description;

  factory Calendar.fromJson(Map<String, dynamic> json) => Calendar(
        id: json["id"],
        date: json["date"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "description": description,
      };
}
