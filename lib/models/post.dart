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
    this.strDescription,
    this.strText,
    this.strImage,
    this.strUser,
  });
  String? strDescription;
  String? strText;
  String? strImage;
  String? strUser;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        strDescription: json['strDescription'],
        strText: json['strText'],
        strImage: json['strImage'],
        strUser: json['strUser'],
      );

  Map<String, dynamic> toJson() => {
        'strDescription': strDescription,
        'strCategory': strText,
        'strImage': strImage,
        'strUser': strUser,
      };
}
