import 'leave_response.dart';

class SaveLeaveDetailsResponse {
  bool? success;
  String? statusMessage;
  int? statusCode;
  Data? data;
  bool? paginated;

  SaveLeaveDetailsResponse(
      {this.success,
      this.statusMessage,
      this.statusCode,
      this.data,
      this.paginated});

  SaveLeaveDetailsResponse.fromJson(Map<String, dynamic> json) {
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
  List<LeaveTypesData>? leaveTypesData;

  Data({this.employeeId, this.leaveTypesData});

  Data.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    if (json['leaveTypesData'] != null) {
      leaveTypesData = <LeaveTypesData>[];
      json['leaveTypesData'].forEach((v) {
        leaveTypesData!.add(new LeaveTypesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeId'] = this.employeeId;
    if (this.leaveTypesData != null) {
      data['leaveTypesData'] =
          this.leaveTypesData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
