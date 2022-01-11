


class FeederInchargeSingle {
  String? feederNo;
  String? feederName;
  String? feederNameBn;
  String? feederLocation;
  String? feederLocationBn;
  String? feederInchargeUserId;
  String? feederInchargeName;
  String? feederInchargeNameBn;
  String? feederEmail;
  String? feederInchargeMobileNo;

  FeederInchargeSingle(
      {this.feederNo,
        this.feederName,
        this.feederNameBn,
        this.feederLocation,
        this.feederLocationBn,
        this.feederInchargeUserId,
        this.feederInchargeName,
        this.feederInchargeNameBn,
        this.feederEmail,
        this.feederInchargeMobileNo});

  FeederInchargeSingle.fromJson(Map<String, dynamic> json) {
    feederNo = json['feeder_no'];
    feederName = json['feeder_name'];
    feederNameBn = json['feeder_name_bn'];
    feederLocation = json['feeder_location'];
    feederLocationBn = json['feeder_location_bn'];
    feederInchargeUserId = json['feeder_incharge_user_id'];
    feederInchargeName = json['feeder_incharge_name'];
    feederInchargeNameBn = json['feeder_incharge_name_bn'];
    feederEmail = json['feeder_email'];
    feederInchargeMobileNo = json['feeder_incharge_mobile_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['feeder_no'] = this.feederNo;
    data['feeder_name'] = this.feederName;
    data['feeder_name_bn'] = this.feederNameBn;
    data['feeder_location'] = this.feederLocation;
    data['feeder_location_bn'] = this.feederLocationBn;
    data['feeder_incharge_user_id'] = this.feederInchargeUserId;
    data['feeder_incharge_name'] = this.feederInchargeName;
    data['feeder_incharge_name_bn'] = this.feederInchargeNameBn;
    data['feeder_email'] = this.feederEmail;
    data['feeder_incharge_mobile_no'] = this.feederInchargeMobileNo;
    return data;
  }
}