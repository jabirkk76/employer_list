class MODEL {
  List<EmployeeDetails>? employeeDetails;

  MODEL({this.employeeDetails});

  MODEL.fromJson(Map<String, dynamic> json) {
    if (json['employee_details'] != null) {
      employeeDetails = <EmployeeDetails>[];
      json['employee_details'].forEach((v) {
        employeeDetails!.add(new EmployeeDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.employeeDetails != null) {
      data['employee_details'] =
          this.employeeDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EmployeeDetails {
  String? name;
  int? experience;
  bool? active;

  EmployeeDetails({this.name, this.experience, this.active});

  EmployeeDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    experience = json['experience'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['experience'] = this.experience;
    data['active'] = this.active;
    return data;
  }
}
