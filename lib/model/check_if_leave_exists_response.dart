import 'dart:ffi';

class CheckIfLeaveExistsResponse {
  bool? success;
  String? statusMessage;
  int? statusCode;
  CheckLeaveExistsData? data;
  bool? paginated;

  CheckIfLeaveExistsResponse(
      {this.success,
      this.statusMessage,
      this.statusCode,
      this.data,
      this.paginated});

  CheckIfLeaveExistsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusMessage = json['status_Message'];
    statusCode = json['status_Code'];
    data = json['data'] != null ? new CheckLeaveExistsData.fromJson(json['data']) : null;
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

class CheckLeaveExistsData {
  int? employeeId;
  double? numberOfDays;

  CheckLeaveExistsData({this.employeeId, this.numberOfDays});

  CheckLeaveExistsData.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    numberOfDays = json['numberOfDays'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeId'] = this.employeeId;
    data['numberOfDays'] = this.numberOfDays;
    return data;
  }
}
