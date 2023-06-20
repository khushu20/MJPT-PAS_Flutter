class DashboardMenuResponse {
  bool? success;
  String? statusMessage;
  int? statusCode;
  List<DashboardMenuList>? data;
  bool? paginated;

  DashboardMenuResponse(
      {this.success,
      this.statusMessage,
      this.statusCode,
      this.data,
      this.paginated});

  DashboardMenuResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusMessage = json['status_Message'];
    statusCode = json['status_Code'];
    if (json['data'] != null) {
      data = <DashboardMenuList>[];
      json['data'].forEach((v) {
        data!.add(new DashboardMenuList.fromJson(v));
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

class DashboardMenuList {
  int? serviceId;
  String? serviceName;
  int? employeeId;

  DashboardMenuList({this.serviceId, this.serviceName, this.employeeId});

  DashboardMenuList.fromJson(Map<String, dynamic> json) {
    serviceId = json['serviceId'];
    serviceName = json['serviceName'];
    employeeId = json['employeeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceId'] = this.serviceId;
    data['serviceName'] = this.serviceName;
    data['employeeId'] = this.employeeId;
    return data;
  }
}