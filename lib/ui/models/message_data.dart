class Msg {
  String name;
  String textmsg;

  Msg({this.name, this.textmsg});
  Msg.fromJson(Map<String, dynamic> json)
      : this(
            name: json['name'], textmsg: json['textmsg']);

  Map<String, dynamic> toJson() =>
      {'name': name, 'textmsg': textmsg};
}
