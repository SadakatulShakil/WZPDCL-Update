

class Login {

  bool? ok;
  Data? data;

  Login({this.ok, this.data});

  Login.fromJson(Map<String, dynamic> json) {
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
  String? aCCOUNTNUM;
  String? mETERNUM;
  String? cUSTOMERNAME;
  String? cUSTOMERADDRESS;
  String? uPAZILA;
  String? dISTRICT;
  String? pHASE;
  String? tARIFF;
  String? sANCLOAD;
  String? rECSTATUS;
  String? mOBILENO;
  String? sECMOBILENO;
  String? eMAIL;
  String? rEGISTRATIONDATE;
  String? lOCATIONCODE;
  String? bENENAME;
  String? bENEMOBILENUM;
  String? bENEEMAIL;
  String? bENERELATIONSHIP;

  Data(
      {this.aCCOUNTNUM,
        this.mETERNUM,
        this.cUSTOMERNAME,
        this.cUSTOMERADDRESS,
        this.uPAZILA,
        this.dISTRICT,
        this.pHASE,
        this.tARIFF,
        this.sANCLOAD,
        this.rECSTATUS,
        this.mOBILENO,
        this.sECMOBILENO,
        this.eMAIL,
        this.rEGISTRATIONDATE,
        this.lOCATIONCODE,
        this.bENENAME,
        this.bENEMOBILENUM,
        this.bENEEMAIL,
        this.bENERELATIONSHIP});

  Data.fromJson(Map<String, dynamic> json) {
    aCCOUNTNUM = json['ACCOUNT_NUM'];
    mETERNUM = json['METER_NUM'];
    cUSTOMERNAME = json['CUSTOMER_NAME'];
    cUSTOMERADDRESS = json['CUSTOMER_ADDRESS'];
    uPAZILA = json['UPAZILA'];
    dISTRICT = json['DISTRICT'];
    pHASE = json['PHASE'];
    tARIFF = json['TARIFF'];
    sANCLOAD = json['SANC_LOAD'];
    rECSTATUS = json['REC_STATUS'];
    mOBILENO = json['MOBILE_NO'];
    sECMOBILENO = json['SEC_MOBILE_NO'];
    eMAIL = json['EMAIL'];
    rEGISTRATIONDATE = json['REGISTRATION_DATE'];
    lOCATIONCODE = json['LOCATION_CODE'];
    bENENAME = json['BENE_NAME'];
    bENEMOBILENUM = json['BENE_MOBILE_NUM'];
    bENEEMAIL = json['BENE_EMAIL'];
    bENERELATIONSHIP = json['BENE_RELATIONSHIP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ACCOUNT_NUM'] = this.aCCOUNTNUM;
    data['METER_NUM'] = this.mETERNUM;
    data['CUSTOMER_NAME'] = this.cUSTOMERNAME;
    data['CUSTOMER_ADDRESS'] = this.cUSTOMERADDRESS;
    data['UPAZILA'] = this.uPAZILA;
    data['DISTRICT'] = this.dISTRICT;
    data['PHASE'] = this.pHASE;
    data['TARIFF'] = this.tARIFF;
    data['SANC_LOAD'] = this.sANCLOAD;
    data['REC_STATUS'] = this.rECSTATUS;
    data['MOBILE_NO'] = this.mOBILENO;
    data['SEC_MOBILE_NO'] = this.sECMOBILENO;
    data['EMAIL'] = this.eMAIL;
    data['REGISTRATION_DATE'] = this.rEGISTRATIONDATE;
    data['LOCATION_CODE'] = this.lOCATIONCODE;
    data['BENE_NAME'] = this.bENENAME;
    data['BENE_MOBILE_NUM'] = this.bENEMOBILENUM;
    data['BENE_EMAIL'] = this.bENEEMAIL;
    data['BENE_RELATIONSHIP'] = this.bENERELATIONSHIP;
    return data;
  }
}