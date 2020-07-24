
class Quote {
  String id;
  String data;
  int like; // How many likes (i.e. thumb up)
  int dislike; // How many dislikes (i.e. thumb down)

  Quote({this.id, this.data, this.like = 0, this.dislike = 0});
  Quote.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'].toString(),
            data: json['data'],
            like: json['like'],
            dislike: json['dislike']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'data': data, 'like': like, 'dislike': dislike};

  int get calculate {
    if (like == 0 && dislike == 0)
      return 0;
    else
      return ((like / (like + dislike)) * 5).round();
  }
}
