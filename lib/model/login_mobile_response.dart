class LoginMobileResponse {
  bool? success;
  String? statusMessage;
  int? statusCode;
  Data? data;
  bool? paginated;

  LoginMobileResponse(
      {this.success,
      this.statusMessage,
      this.statusCode,
      this.data,
      this.paginated});

  LoginMobileResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusMessage = json['status_Message'];
    statusCode = json['status_Code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    paginated = json['paginated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_Message'] = this.statusMessage;
    data['status_Code'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['paginated'] = this.paginated;
    return data;
  }
}

class Data {
  int? employeeId;
  int? userId;
  String? postId;
  String? employeeName;
  String? designation;
  String? userName;
  String? mobileNumber;
  String? photoPath;
  String? bloodGroup;
  String? gender;
  String? email;
  String? otpMobile;
  String? deviceId;
  String? authToken;
  String? location;
  String? mpin;
  int? officeCode;
  String? latitude;
  String? longitude;
  String? radius;
  int? locationId;
  String? employeeType;
  String? sessionToken;
  int? roleId;

  Data(
      {this.employeeId,
      this.userId,
      this.postId,
      this.employeeName,
      this.designation,
      this.userName,
      this.mobileNumber,
      this.photoPath,
      this.bloodGroup,
      this.gender,
      this.email,
      this.otpMobile,
      this.deviceId,
      this.authToken,
      this.location,
      this.mpin,
      this.officeCode,
      this.latitude,
      this.longitude,
      this.radius,
      this.locationId,
      this.employeeType,
      this.sessionToken,
      this.roleId
      });

  Data.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    userId = json['userId'];
    postId = json['postId'];
    employeeName = json['employeeName'];
    designation = json['designation'];
    userName = json['userName'];
    mobileNumber = json['mobileNumber'];
    photoPath = json['photoPath'];
    bloodGroup = json['bloodGroup'];
    gender = json['gender'];
    email = json['email'];
    otpMobile = json['otpMobile'];
    deviceId = json['deviceId'];
    authToken = json['authToken'];
    location = json['location'];
    mpin = json['mpin'];
    officeCode = json['officeCode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    radius = json['radius'];
    locationId = json['locationId'];
    employeeType = json['employeeType'];
    sessionToken = json['sessionToken'];
    roleId = json['roleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeId'] = this.employeeId;
    data['userId'] = this.userId;
    data['postId'] = this.postId;
    data['employeeName'] = this.employeeName;
    data['designation'] = this.designation;
    data['userName'] = this.userName;
    data['mobileNumber'] = this.mobileNumber;
    data['photoPath'] = this.photoPath;
    data['bloodGroup'] = this.bloodGroup;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['otpMobile'] = this.otpMobile;
    data['deviceId'] = this.deviceId;
    data['authToken'] = this.authToken;
    data['location'] = this.location;
    data['mpin'] = this.mpin;
    data['officeCode'] = this.officeCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['radius'] = this.radius;
    data['locationId'] = this.locationId;
    data['employeeType'] = this.employeeType;
    data['sessionToken'] = this.sessionToken;
    data['roleId'] = this.roleId;
    return data;
  }
}
