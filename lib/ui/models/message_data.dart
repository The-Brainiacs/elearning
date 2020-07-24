class Msg {
  String id;
  String name;
  String textmsg;

  Msg({this.id, this.name, this.textmsg});
  Msg.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'], name: json['name'], textmsg: json['textmsg']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'textmsg': textmsg};
}
