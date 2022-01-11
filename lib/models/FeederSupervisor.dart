
class FeederSupervisor {
  String? substationNo;
  String? substationName;
  String? substationNameBn;
  String? officeSupervisorName;
  String? officeSupervisorNameBn;
  String? officeSupervisorEmail;
  String? feederSupervisorUserId;
  String? feederSupervisorMobileNo;

  FeederSupervisor(
      {this.substationNo,
        this.substationName,
        this.substationNameBn,
        this.officeSupervisorName,
        this.officeSupervisorNameBn,
        this.officeSupervisorEmail,
        this.feederSupervisorUserId,
        this.feederSupervisorMobileNo});

  FeederSupervisor.fromJson(Map<String, dynamic> json) {
    substationNo = json['substation_no'];
    substationName = json['substation_name'];
    substationNameBn = json['substation_name_bn'];
    officeSupervisorName = json['office_supervisor_name'];
    officeSupervisorNameBn = json['office_supervisor_name_bn'];
    officeSupervisorEmail = json['office_supervisor_email'];
    feederSupervisorUserId = json['feeder_supervisor_user_id'];
    feederSupervisorMobileNo = json['feeder_supervisor_mobile_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['substation_no'] = this.substationNo;
    data['substation_name'] = this.substationName;
    data['substation_name_bn'] = this.substationNameBn;
    data['office_supervisor_name'] = this.officeSupervisorName;
    data['office_supervisor_name_bn'] = this.officeSupervisorNameBn;
    data['office_supervisor_email'] = this.officeSupervisorEmail;
    data['feeder_supervisor_user_id'] = this.feederSupervisorUserId;
    data['feeder_supervisor_mobile_no'] = this.feederSupervisorMobileNo;
    return data;
  }
}