class LeaveResponse {
  bool? success;
  String? statusMessage;
  int? statusCode;
  LeaveData? data;
  bool? paginated;

  LeaveResponse(
      {this.success,
      this.statusMessage,
      this.statusCode,
      this.data,
      this.paginated});

  LeaveResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusMessage = json['status_Message'];
    statusCode = json['status_Code'];
    data = json['data'] != null ? new LeaveData.fromJson(json['data']) : null;
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

class LeaveData {
  int? employeeId;
  List<LeaveTypesData>? leaveTypesData;

  LeaveData({this.employeeId, this.leaveTypesData});

  LeaveData.fromJson(Map<String, dynamic> json) {
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

class LeaveTypesData {
  int? leaveId;
  String? leaveName;
  double? leaveBalance;

  LeaveTypesData({this.leaveId, this.leaveName, this.leaveBalance});

  LeaveTypesData.fromJson(Map<String, dynamic> json) {
    leaveId = json['leaveId'];
    leaveName = json['leaveName'];
    leaveBalance = json['leaveBalance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leaveId'] = this.leaveId;
    data['leaveName'] = this.leaveName;
    data['leaveBalance'] = this.leaveBalance;
    return data;
  }
}
