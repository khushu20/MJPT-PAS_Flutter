class SampleModelClass {
  String? noOfDays;
  String? salary;

  SampleModelClass({this.noOfDays, this.salary});

  SampleModelClass.fromJson(Map<String, dynamic> json) {
    noOfDays = json['no.of days'];
    salary = json['salary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no.of days'] = this.noOfDays;
    data['salary'] = this.salary;
    return data;
  }
}
