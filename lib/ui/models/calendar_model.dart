class Calendar {
  String date;
  String description;

  Calendar({this.date, this.description});
  Calendar.fromJson(Map<String, dynamic> json)
      : this(
          date: json['date'],
          description: json['description'],
        );

  Map<String, dynamic> toJson() => {'date': date, 'description': description};
}
