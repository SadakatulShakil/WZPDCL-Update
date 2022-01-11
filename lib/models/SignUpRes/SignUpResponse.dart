class SignUpRes {
  bool? ok;
  String? msg;

  SignUpRes({this.ok, this.msg});

  SignUpRes.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = this.ok;
    data['msg'] = this.msg;
    return data;
  }
}