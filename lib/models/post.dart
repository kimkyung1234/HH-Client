class Post {
  Post({
    this.posts,
  });
  List<Value>? posts;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        posts: List<Value>.from(json['posts'].map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'posts': List<dynamic>.from(posts!.map((x) => x.toJson())),
      };
}

class Value {
  Value({
    this.strContent,
    this.strTitle,
    this.strImage,
    this.strUser,
  });
  String? strContent;
  String? strTitle;
  String? strImage;
  String? strUser;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        strContent: json['strContent'],
        strTitle: json['strTitle'],
        strImage: json['strImage'],
        strUser: json['strUser'],
      );

  Map<String, dynamic> toJson() => {
        'strContent': strContent,
        'strTitle': strTitle,
        'strImage': strImage,
        'strUser': strUser,
      };
}
