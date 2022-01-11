class PayBillList {
  bool? ok;
  List<Data>? data;

  PayBillList({this.ok, this.data});

  PayBillList.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = this.ok;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? tRANSACTIONID;
  String? tRANSACTIONDATE;
  String? lOCATIONCODE;
  String? aCCOUNTNO;
  String? bILLNUM;
  double? tOTALBILL;
  String? cREATEDATE;
  double? tOTALVAT;
  double? sTAMPFEE;
  String? rEMARKS;
  String? bILLMONTH;
  double? pAIDAMOUNT;

  Data(
      {this.tRANSACTIONID,
        this.tRANSACTIONDATE,
        this.lOCATIONCODE,
        this.aCCOUNTNO,
        this.bILLNUM,
        this.tOTALBILL,
        this.cREATEDATE,
        this.tOTALVAT,
        this.sTAMPFEE,
        this.rEMARKS,
        this.bILLMONTH,
        this.pAIDAMOUNT});

  Data.fromJson(Map<String, dynamic> json) {
    tRANSACTIONID = json['TRANSACTION_ID'];
    tRANSACTIONDATE = json['TRANSACTION_DATE'];
    lOCATIONCODE = json['LOCATION_CODE'];
    aCCOUNTNO = json['ACCOUNT_NO'];
    bILLNUM = json['BILL_NUM'];
    tOTALBILL = json['TOTAL_BILL'];
    cREATEDATE = json['CREATE_DATE'];
    tOTALVAT = json['TOTAL_VAT'];
    sTAMPFEE = json['STAMP_FEE'];
    rEMARKS = json['REMARKS'];
    bILLMONTH = json['BILL_MONTH'];
    pAIDAMOUNT = json['PAID_AMOUNT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TRANSACTION_ID'] = this.tRANSACTIONID;
    data['TRANSACTION_DATE'] = this.tRANSACTIONDATE;
    data['LOCATION_CODE'] = this.lOCATIONCODE;
    data['ACCOUNT_NO'] = this.aCCOUNTNO;
    data['BILL_NUM'] = this.bILLNUM;
    data['TOTAL_BILL'] = this.tOTALBILL;
    data['CREATE_DATE'] = this.cREATEDATE;
    data['TOTAL_VAT'] = this.tOTALVAT;
    data['STAMP_FEE'] = this.sTAMPFEE;
    data['REMARKS'] = this.rEMARKS;
    data['BILL_MONTH'] = this.bILLMONTH;
    data['PAID_AMOUNT'] = this.pAIDAMOUNT;
    return data;
  }

  @override
  String toString() {
    return 'Data{tRANSACTIONID: $tRANSACTIONID, tRANSACTIONDATE: $tRANSACTIONDATE, lOCATIONCODE: $lOCATIONCODE, aCCOUNTNO: $aCCOUNTNO, bILLNUM: $bILLNUM, tOTALBILL: $tOTALBILL, cREATEDATE: $cREATEDATE, tOTALVAT: $tOTALVAT, sTAMPFEE: $sTAMPFEE, rEMARKS: $rEMARKS, bILLMONTH: $bILLMONTH, pAIDAMOUNT: $pAIDAMOUNT}';
  }
}