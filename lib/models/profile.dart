class Profile {
  Profile({
    this.strName,
    this.strImage,
    this.strDescription,
    this.strEmail,
  });
  String? strName;
  String? strImage;
  String? strDescription;
  String? strEmail;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        strName: json['userName'],
        strImage: json['imageUrl'],
        strDescription: json['description'],
        strEmail: json['email'],
      );

  Map<String, dynamic> toJson() => {
        'strName': strName,
        'strImage': strImage,
        'strDescription': strDescription,
        'strEmail': strEmail,
      };
}
