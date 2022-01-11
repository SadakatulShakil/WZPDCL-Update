

class TicketParams {
  String? employeeId;
  String? circleId;
  int? UserID;

  TicketParams({this.employeeId});

  TicketParams.fromJson(Map<String, dynamic> json) {
    employeeId = json['employee_id'];
    circleId = json['circle_id'];
    UserID = json['UserID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employee_id'] = this.employeeId;
    data['circle_id'] = this.circleId;
    data['UserID'] = this.UserID;
    return data;
  }

}