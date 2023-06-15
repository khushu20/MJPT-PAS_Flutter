class ValidateMpinPayload {
  String? appName;
  UserModel? userModel;

  ValidateMpinPayload({this.appName, this.userModel});

  ValidateMpinPayload.fromJson(Map<String, dynamic> json) {
    appName = json['appName'];
    userModel = json['userModel'] != null
        ? new UserModel.fromJson(json['userModel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appName'] = this.appName;
    if (this.userModel != null) {
      data['userModel'] = this.userModel!.toJson();
    }
    return data;
  }
}

class UserModel {
  String? mobileNumber;
  String? mpin;
  int? userId;
  String? userName;

  UserModel({this.mobileNumber, this.mpin, this.userId, this.userName});

  UserModel.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobileNumber'];
    mpin = json['mpin'];
    userId = json['userId'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobileNumber'] = this.mobileNumber;
    data['mpin'] = this.mpin;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    return data;
  }
}
