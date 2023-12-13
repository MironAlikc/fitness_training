class TokenModel {
  String? tokenType;
  String? accessToken;
  Null expires;
  User? user;

  TokenModel({this.tokenType, this.accessToken, this.expires, this.user});

  TokenModel.fromJson(Map<String, dynamic> json) {
    tokenType = json['TokenType'];
    accessToken = json['AccessToken'];
    expires = json['Expires'];
    user = json['User'] != null ? User.fromJson(json['User']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['TokenType'] = tokenType;
    data['AccessToken'] = accessToken;
    data['Expires'] = expires;
    if (user != null) {
      data['User'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? type;

  User({this.id, this.firstName, this.lastName, this.type});

  User.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['Type'] = type;
    return data;
  }
}
