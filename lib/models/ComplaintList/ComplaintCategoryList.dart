class ComplaintCategoryList {
  String? ok;
  List<complain_category>? complainCategory;

  ComplaintCategoryList({this.ok, this.complainCategory});

  ComplaintCategoryList.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    if (json['complain_category'] != null) {
      complainCategory = <complain_category>[];
      json['complain_category'].forEach((v) {
        complainCategory!.add(new complain_category.fromJson(v));
      });
    }
  }

/*  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = this.ok;
    if (this.complainCategory != null) {
      data['complain_category'] =
          this.complainCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }*/
}

class complain_category {
  String? complainType;
  String? complainTypeBn;

  complain_category({this.complainType, this.complainTypeBn});

  complain_category.fromJson(Map<String, dynamic> json) {
    complainType = json['complain_type'];
    complainTypeBn = json['complain_type_bn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['complain_type'] = this.complainType;
    data['complain_type_bn'] = this.complainTypeBn;
    return data;
  }
}