class VersioncheckPayload {
  String? appName;
  String? mobileType;
  String? webServiceName;

  VersioncheckPayload({this.appName, this.mobileType, this.webServiceName});

  VersioncheckPayload.fromJson(Map<String, dynamic> json) {
    appName = json['appName'];
    mobileType = json['mobileType'];
    webServiceName = json['webServiceName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appName'] = this.appName;
    data['mobileType'] = this.mobileType;
    data['webServiceName'] = this.webServiceName;
    return data;
  }
}
