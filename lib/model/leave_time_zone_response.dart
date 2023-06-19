class LeaveTimeZoneResponse {
  bool? success;
  String? statusMessage;
  int? statusCode;
  List<LeaveTimeZoneData>? data;
  bool? paginated;

  LeaveTimeZoneResponse(
      {this.success,
      this.statusMessage,
      this.statusCode,
      this.data,
      this.paginated});

  LeaveTimeZoneResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusMessage = json['status_Message'];
    statusCode = json['status_Code'];
    if (json['data'] != null) {
      data = <LeaveTimeZoneData>[];
      json['data'].forEach((v) {
        data!.add(new LeaveTimeZoneData.fromJson(v));
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

class LeaveTimeZoneData {
  int? leaveTimeZoneId;
  String? leaveTimeZoneName;

  LeaveTimeZoneData({this.leaveTimeZoneId, this.leaveTimeZoneName});

  LeaveTimeZoneData.fromJson(Map<String, dynamic> json) {
    leaveTimeZoneId = json['leaveTimeZoneId'];
    leaveTimeZoneName = json['leaveTimeZoneName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leaveTimeZoneId'] = this.leaveTimeZoneId;
    data['leaveTimeZoneName'] = this.leaveTimeZoneName;
    return data;
  }
}
