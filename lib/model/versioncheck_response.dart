class VersionCheckResponse {
  String? tag;
  String? url;
  String? message;
  String? version;
  bool? status;
  bool? accountDeleteFlag;

  VersionCheckResponse(
      {this.tag, this.url, this.message, this.status, this.accountDeleteFlag, this.version});

  VersionCheckResponse.fromJson(Map<String, dynamic> json) {
    tag = json['tag'];
    url = json['url'];
    message = json['Message'];
    status = json['status'];
    version = json['version'];
    accountDeleteFlag = json['Account_Delete_Flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tag'] = this.tag;
    data['url'] = this.url;
    data['Message'] = this.message;
    data['status'] = this.status;
    data['version'] = this.version;
    data['Account_Delete_Flag'] = this.accountDeleteFlag;
    return data;
  }
}