class CheckIfLeaveExistsPayload {
  String? appName;
  CheckLeaveBalanceModel? leaveBalanceModel;
  String? sessionToken;
  int? userId;

  CheckIfLeaveExistsPayload(
      {this.appName, this.leaveBalanceModel, this.sessionToken, this.userId});

  CheckIfLeaveExistsPayload.fromJson(Map<String, dynamic> json) {
    appName = json['appName'];
    leaveBalanceModel = json['leaveBalanceModel'] != null
        ? new CheckLeaveBalanceModel.fromJson(json['leaveBalanceModel'])
        : null;
    sessionToken = json['sessionToken'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appName'] = this.appName;
    if (this.leaveBalanceModel != null) {
      data['leaveBalanceModel'] = this.leaveBalanceModel!.toJson();
    }
    data['sessionToken'] = this.sessionToken;
    data['userId'] = this.userId;
    return data;
  }
}

class CheckLeaveBalanceModel {
  int? employeeId;
  String? fileName;
  String? fromDate;
  String? leaveDocument;
  int? leaveId;
  int? leaveTimeZoneId;
  String? toDate;

  CheckLeaveBalanceModel(
      {this.employeeId,
      this.fileName,
      this.fromDate,
      this.leaveDocument,
      this.leaveId,
      this.leaveTimeZoneId,
      this.toDate});

  CheckLeaveBalanceModel.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    fileName = json['fileName'];
    fromDate = json['fromDate'];
    leaveDocument = json['leaveDocument'];
    leaveId = json['leaveId'];
    leaveTimeZoneId = json['leaveTimeZoneId'];
    toDate = json['toDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeId'] = this.employeeId;
    data['fileName'] = this.fileName;
    data['fromDate'] = this.fromDate;
    data['leaveDocument'] = this.leaveDocument;
    data['leaveId'] = this.leaveId;
    data['leaveTimeZoneId'] = this.leaveTimeZoneId;
    data['toDate'] = this.toDate;
    return data;
  }
}
