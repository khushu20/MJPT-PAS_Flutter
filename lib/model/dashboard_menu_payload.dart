class DashboardMenuPayload {
  String? appName;
  DashboardMenuModel? roleServiceModel;
  String? sessionToken;
  int? userId;

  DashboardMenuPayload(
      {this.appName, this.roleServiceModel, this.sessionToken, this.userId});

  DashboardMenuPayload.fromJson(Map<String, dynamic> json) {
    appName = json['appName'];
    roleServiceModel = json['roleServiceModel'] != null
        ? new DashboardMenuModel.fromJson(json['roleServiceModel'])
        : null;
    sessionToken = json['sessionToken'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appName'] = this.appName;
    if (this.roleServiceModel != null) {
      data['roleServiceModel'] = this.roleServiceModel!.toJson();
    }
    data['sessionToken'] = this.sessionToken;
    data['userId'] = this.userId;
    return data;
  }
}

class DashboardMenuModel {
  int? employeeId;
  int? roleId;

  DashboardMenuModel({this.employeeId, this.roleId});

  DashboardMenuModel.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    roleId = json['roleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeId'] = this.employeeId;
    data['roleId'] = this.roleId;
    return data;
  }
}
