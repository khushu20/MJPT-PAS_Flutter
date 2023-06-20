class LeaveTimeZonePayload {
  String? appName;

  LeaveTimeZonePayload({this.appName});

  LeaveTimeZonePayload.fromJson(Map<String, dynamic> json) {
    appName = json['appName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appName'] = this.appName;
    return data;
  }
}
