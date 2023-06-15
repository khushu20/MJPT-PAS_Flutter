class ValidateMpinResponse {
  bool? success;
  String? statusMessage;
  int? statusCode;
  List<ValidateMpinData>? data;
  bool? paginated;

  ValidateMpinResponse(
      {this.success,
      this.statusMessage,
      this.statusCode,
      this.data,
      this.paginated});

  ValidateMpinResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusMessage = json['status_Message'];
    statusCode = json['status_Code'];
    if (json['data'] != null) {
      data = <ValidateMpinData>[];
      json['data'].forEach((v) {
        data!.add(new ValidateMpinData.fromJson(v));
      });
    }
    paginated = json['paginated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_Message'] = this.statusMessage;
    data['status_Code'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['paginated'] = this.paginated;
    return data;
  }
}

class ValidateMpinData {
  int? roleId;
  String? roleName;

  ValidateMpinData({this.roleId, this.roleName});

  ValidateMpinData.fromJson(Map<String, dynamic> json) {
    roleId = json['roleId'];
    roleName = json['roleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roleId'] = this.roleId;
    data['roleName'] = this.roleName;
    return data;
  }
}
