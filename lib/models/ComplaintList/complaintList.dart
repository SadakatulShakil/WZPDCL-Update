class ComplaintList {

  //List<ComplaintList>? comList;
  String? complainType;
  String? complainTypeBn;
  String? complain;
  String? complainBn;

  ComplaintList(
      {this.complainType, this.complainTypeBn, this.complain, this.complainBn}
  );

  ComplaintList.fromJson(Map<String, dynamic> json) {
    complainType = json['complain_type'];
    complainTypeBn = json['complain_type_bn'];
    complain = json['complain'];
    complainBn = json['complain_bn'];
  }

/*  ComplaintList.listFromJson(List<dynamic> list) {
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+comList.toString());
    list.forEach((element) {
      if(comList != null ){
        comList!.add(new ComplaintList.fromJson(element));
      }else{
        comList![0] = new ComplaintList.fromJson(element);
      }

    });
  }*/

 /* Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['complain_type'] = this.complainType;
    data['complain_type_bn'] = this.complainTypeBn;
    data['complain'] = this.complain;
    data['complain_bn'] = this.complainBn;
    return data;
  }*/
}