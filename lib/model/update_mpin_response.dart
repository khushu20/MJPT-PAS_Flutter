class UpdateMpinResponse {
  bool? success;
  String? statusMessage;
  int? statusCode;
  bool? paginated;

  UpdateMpinResponse(
      {this.success, this.statusMessage, this.statusCode, this.paginated});

  UpdateMpinResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusMessage = json['status_Message'];
    statusCode = json['status_Code'];
    paginated = json['paginated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_Message'] = this.statusMessage;
    data['status_Code'] = this.statusCode;
    data['paginated'] = this.paginated;
    return data;
  }
}
