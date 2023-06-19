class LeavePayload {
  String? appName;
  LeaveBalanceModel? leaveBalanceModel;
  String? sessionToken;
  int? userId;

  LeavePayload(
      {this.appName, this.leaveBalanceModel, this.sessionToken, this.userId});

  LeavePayload.fromJson(Map<String, dynamic> json) {
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

  LeaveBalanceModel({this.employeeId});

  LeaveBalanceModel.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeId'] = this.employeeId;
    return data;
  }
}
