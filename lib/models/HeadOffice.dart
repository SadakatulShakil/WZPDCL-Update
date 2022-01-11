


class HeadOffice {
  String? officeNo;
  String? unitOfficeName;
  String? unitOfficeNameBn;
  String? officeAddress;
  String? officeAddressBn;
  String? officeHeadEmailAddress;
  String? officeHeadWebAddress;
  String? officeMapAddress;
  String? officeHeadMobileNo;

  HeadOffice(
      {this.officeNo,
        this.unitOfficeName,
        this.unitOfficeNameBn,
        this.officeAddress,
        this.officeAddressBn,
        this.officeHeadEmailAddress,
        this.officeHeadWebAddress,
        this.officeMapAddress,
        this.officeHeadMobileNo});

  HeadOffice.fromJson(Map<String, dynamic> json) {
    officeNo = json['office_no'];
    unitOfficeName = json['unit_office_name'];
    unitOfficeNameBn = json['unit_office_name_bn'];
    officeAddress = json['office_address'];
    officeAddressBn = json['office_address_bn'];
    officeHeadEmailAddress = json['office_head_email_address'];
    officeHeadWebAddress = json['office_head_web_address'];
    officeMapAddress = json['office_map_address'];
    officeHeadMobileNo = json['office_head_mobile_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['office_no'] = this.officeNo;
    data['unit_office_name'] = this.unitOfficeName;
    data['unit_office_name_bn'] = this.unitOfficeNameBn;
    data['office_address'] = this.officeAddress;
    data['office_address_bn'] = this.officeAddressBn;
    data['office_head_email_address'] = this.officeHeadEmailAddress;
    data['office_head_web_address'] = this.officeHeadWebAddress;
    data['office_map_address'] = this.officeMapAddress;
    data['office_head_mobile_no'] = this.officeHeadMobileNo;
    return data;
  }
}