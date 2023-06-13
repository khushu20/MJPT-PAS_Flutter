class LoginMobilePayload {
  String? appName;
  String? deviceId;
  String? deviceType;
  String? fcmToken;
  bool? isMobileNoAuth;
  String? mobileNumber;
  String? password;
  String? username;

  LoginMobilePayload(
      {this.appName,
      this.deviceId,
      this.deviceType,
      this.fcmToken,
      this.isMobileNoAuth,
      this.mobileNumber,
      this.password,
      this.username});

  LoginMobilePayload.fromJson(Map<String, dynamic> json) {
    appName = json['appName'];
    deviceId = json['deviceId'];
    deviceType = json['deviceType'];
    fcmToken = json['fcmToken'];
    isMobileNoAuth = json['isMobileNoAuth'];
    mobileNumber = json['mobileNumber'];
    password = json['password'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appName'] = this.appName;
    data['deviceId'] = this.deviceId;
    data['deviceType'] = this.deviceType;
    data['fcmToken'] = this.fcmToken;
    data['isMobileNoAuth'] = this.isMobileNoAuth;
    data['mobileNumber'] = this.mobileNumber;
    data['password'] = this.password;
    data['username'] = this.username;
    return data;
  }
}
