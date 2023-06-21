class SaveLeaveDetailsPayload {
  String? appName;
  LeaveBalanceModel? leaveBalanceModel;
  String? sessionToken;
  int? userId;

  SaveLeaveDetailsPayload(
      {this.appName, this.leaveBalanceModel, this.sessionToken, this.userId});

  SaveLeaveDetailsPayload.fromJson(Map<String, dynamic> json) {
    appName = json['appName'];
    leaveBalanceModel = json['leaveBalanceModel'] != null
        ? new LeaveBalanceModel.fromJson(json['leaveBalanceModel'])
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

class LeaveBalanceModel {
  int? employeeId;
  String? fileName;
  String? fromDate;
  String? leaveDocument;
  int? leaveId;
  String? leaveName;
  int? leaveTimeZoneId;
  String? leavingHQ;
  int? mobileNo;
  double? numberOfDays;
  int? openingBalance;
  String? purpose;
  String? toDate;

  LeaveBalanceModel(
      {this.employeeId,
      this.fileName,
      this.fromDate,
      this.leaveDocument,
      this.leaveId,
      this.leaveName,
      this.leaveTimeZoneId,
      this.leavingHQ,
      this.mobileNo,
      this.numberOfDays,
      this.openingBalance,
      this.purpose,
      this.toDate});

  LeaveBalanceModel.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    fileName = json['fileName'];
    fromDate = json['fromDate'];
    leaveDocument = json['leaveDocument'];
    leaveId = json['leaveId'];
    leaveName = json['leaveName'];
    leaveTimeZoneId = json['leaveTimeZoneId'];
    leavingHQ = json['leavingHQ'];
    mobileNo = json['mobileNo'];
    numberOfDays = json['numberOfDays'];
    openingBalance = json['openingBalance'];
    purpose = json['purpose'];
    toDate = json['toDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeId'] = this.employeeId;
    data['fileName'] = this.fileName;
    data['fromDate'] = this.fromDate;
    data['leaveDocument'] = this.leaveDocument;
    data['leaveId'] = this.leaveId;
    data['leaveName'] = this.leaveName;
    data['leaveTimeZoneId'] = this.leaveTimeZoneId;
    data['leavingHQ'] = this.leavingHQ;
    data['mobileNo'] = this.mobileNo;
    data['numberOfDays'] = this.numberOfDays;
    data['openingBalance'] = this.openingBalance;
    data['purpose'] = this.purpose;
    data['toDate'] = this.toDate;
    return data;
  }
}
