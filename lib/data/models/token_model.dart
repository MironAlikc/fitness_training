class TokenModel {
  TokenModel({this.tokenType, this.accessToken, this.user});

  TokenModel.fromJson(Map<String, dynamic> json) {
    tokenType = json["TokenType"];
    accessToken = json["AccessToken"];
    user = json["User"] != null ? User.fromJson(json["User"]) : null;
  }
  String? tokenType;
  String? accessToken;
  User? user;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["TokenType"] = tokenType;
    data["AccessToken"] = accessToken;
    if (user != null) {
      data["User"] = user!.toJson();
    }
    return data;
  }
}

class User {
  User({this.id, this.firstName, this.lastName, this.type});

  User.fromJson(Map<String, dynamic> json) {
    id = json["Id"];
    firstName = json["FirstName"];
    lastName = json["LastName"];
    type = json["Type"];
  }
  int? id;
  String? firstName;
  String? lastName;
  String? type;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Id"] = id;
    data["FirstName"] = firstName;
    data["LastName"] = lastName;
    data["Type"] = type;
    return data;
  }
}
