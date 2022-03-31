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
        strName: json['strName'],
        strImage: json['strImage'],
        strDescription: json['strDescription'],
        strEmail: json['strEmail'],
      );

  Map<String, dynamic> toJson() => {
        'strName': strName,
        'strImage': strImage,
        'strDescription': strDescription,
        'strEmail': strEmail,
      };
}
