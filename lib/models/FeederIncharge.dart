


class FeederIncharge {
  String? subDesignation;
  String? feederInchargeUserId;
  String? feederNo;
  String? feederName;
  String? feederNameBn;
  String? feederLocation;
  String? feederLocationBn;
  String? feederEmail;
  String? feederInchargeMobileNo;

  FeederIncharge(
      {this.subDesignation,
        this.feederInchargeUserId,
        this.feederNo,
        this.feederName,
        this.feederNameBn,
        this.feederLocation,
        this.feederLocationBn,
        this.feederEmail,
        this.feederInchargeMobileNo});

  FeederIncharge.fromJson(Map<String, dynamic> json) {
    subDesignation = json['sub_designation'];
    feederInchargeUserId = json['feeder_incharge_user_id'];
    feederNo = json['feeder_no'];
    feederName = json['feeder_name'];
    feederNameBn = json['feeder_name_bn'];
    feederLocation = json['feeder_location'];
    feederLocationBn = json['feeder_location_bn'];
    feederEmail = json['feeder_email'];
    feederInchargeMobileNo = json['feeder_incharge_mobile_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_designation'] = this.subDesignation;
    data['feeder_incharge_user_id'] = this.feederInchargeUserId;
    data['feeder_no'] = this.feederNo;
    data['feeder_name'] = this.feederName;
    data['feeder_name_bn'] = this.feederNameBn;
    data['feeder_location'] = this.feederLocation;
    data['feeder_location_bn'] = this.feederLocationBn;
    data['feeder_email'] = this.feederEmail;
    data['feeder_incharge_mobile_no'] = this.feederInchargeMobileNo;
    return data;
  }
}