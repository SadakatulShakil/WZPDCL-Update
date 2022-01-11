class DueBillsResponse {
  bool? ok;
  Data? data;

  DueBillsResponse({this.ok, this.data});

  DueBillsResponse.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = this.ok;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? bILLNUM;
  String? iNVOICEDATE;
  String? aCCOUNTNUM;
  String? bILLMONTH;
  String? lASTPAYDATE;
  double? tOTALBILLAMOUNT;
  double? vATAMT;
  String? cREATEDATE;
  String? rEMARKS;
  String? bILLSTATUS;
  String? lOCATIONCODE;
  int? pAIDMON;
  double? tUNIT;

  Data(
      {this.bILLNUM,
        this.iNVOICEDATE,
        this.aCCOUNTNUM,
        this.bILLMONTH,
        this.lASTPAYDATE,
        this.tOTALBILLAMOUNT,
        this.vATAMT,
        this.cREATEDATE,
        this.rEMARKS,
        this.bILLSTATUS,
        this.lOCATIONCODE,
        this.pAIDMON,
        this.tUNIT});

  Data.fromJson(Map<String, dynamic> json) {
    bILLNUM = json['BILL_NUM'];
    iNVOICEDATE = json['INVOICE_DATE'];
    aCCOUNTNUM = json['ACCOUNT_NUM'];
    bILLMONTH = json['BILL_MONTH'];
    lASTPAYDATE = json['LAST_PAY_DATE'];
    tOTALBILLAMOUNT = json['TOTAL_BILL_AMOUNT'];
    vATAMT = json['VAT_AMT'];
    cREATEDATE = json['CREATE_DATE'];
    rEMARKS = json['REMARKS'];
    bILLSTATUS = json['BILL_STATUS'];
    lOCATIONCODE = json['LOCATION_CODE'];
    pAIDMON = json['PAID_MON'];
    tUNIT = json['TUNIT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BILL_NUM'] = this.bILLNUM;
    data['INVOICE_DATE'] = this.iNVOICEDATE;
    data['ACCOUNT_NUM'] = this.aCCOUNTNUM;
    data['BILL_MONTH'] = this.bILLMONTH;
    data['LAST_PAY_DATE'] = this.lASTPAYDATE;
    data['TOTAL_BILL_AMOUNT'] = this.tOTALBILLAMOUNT;
    data['VAT_AMT'] = this.vATAMT;
    data['CREATE_DATE'] = this.cREATEDATE;
    data['REMARKS'] = this.rEMARKS;
    data['BILL_STATUS'] = this.bILLSTATUS;
    data['LOCATION_CODE'] = this.lOCATIONCODE;
    data['PAID_MON'] = this.pAIDMON;
    data['TUNIT'] = this.tUNIT;
    return data;
  }
}