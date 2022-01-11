
import 'package:shared_preferences/shared_preferences.dart';

class AppConstant {

  //Key
  static final String CUSTOMER_NAME =  "CUSTOMER_NAME";
  static final String CUSTOMER_NO =  "CUSTOMER_NO";
  static final String MOBILE_NO =  "MOBILE_NO";
  static final String METER_NUM =  "METER_NUM";
  static final String ACCOUNT_NUM =  "ACCOUNT_NUM";
  static final String IS_LOGGED_IN =  "IS_LOGGED_IN";
  static final String IS_VERIFIED =  "IS_VERIFIED";
  static final String UNIT_OFFICE =  "UNIT_OFFICE";
  static final String ADMIN_LOGIN_DATA =  "ADMIN_LOGIN_DATA";
  static final String CUSTOMER_ADDRESS =  "CUSTOMER_ADDRESS";
  static final String CUSTOMER_UPAZILA =  "UPAZILA";
  static final String CUSTOMER_DISTRICT =  "DISTRICT";
  static final String TARIFF =  "TARIFF";
  static final String SANC_LOAD =  "SANC_LOAD";
  static final String CUSTOMER_EMAIL =  "EMAIL";



  //Value
  static final String PHONE_NUMBER =  "16117";
  static final String SURVEY =  "survey";
  static final String QUIZ =  "quiz";
  static final String English =  "en";
  static final String Bangla =  "bn";

  static final String PRIVACY_POLICY_URL =  "http://wzpdcl.gov.bd/site/page/5de00aaf-60e0-4839-85fa-4b73ad4b9d5a";
  static final String App_URL =  "https://play.google.com/store/apps/details?id=com.adndiginet.joy.wzpdcl_app_flutter";
  static final String SM =  "https://m.facebook.com/";

  static final String Facebook =  "https://www.facebook.com/wzpdcl.khulna";
  static final String Twitter =  "https://twitter.com/wzpdcl";
  static final String Instagram =  "https://www.instagram.com/wzpdclkhulna";
  static final String Linkedin =  "https://www.linkedin.com/in/west-zone-power-distribution-company-ltd-wzpdcl-101a791b3";
  static final String Youtube =  "https://www.youtube.com/channel/UCd6U6c-TRo63fEkgFGNGD6w";
  static final String Wikipedia =  "https://en.wikipedia.org/wiki/West_Zone_Power_Distribution_Company";


  static final String Office_Head =  "office_head";
  static final String Feeder_Supervisor =  "feeder_supervisor";
  static final String Feeder_Incharge =  "feeder_incharge";

  static final String Complaint_Flug_Open =  "Open";
  static final String Complaint_Flug_WorkinProgress =  "Work in Progress";
  static final String Complaint_Flug_Solved =  "Solved";
  static final String Complaint_Flug_Rejected =  "Rejected";
  static final String Complaint_Flug_New =  "New";

  static String getSurveyOrQuizUrl(String? mobile, String? account, String? quizOrSurvay, String language){
    if(language == Bangla){
      return "https://customercare.wzpdcl.gov.bd/west_zone/bn/index.php?phone_number=${mobile}&account_number=${account}&selected_menu=$quizOrSurvay";
    }
    return "https://customercare.wzpdcl.gov.bd/west_zone/index.php?phone_number=${mobile}&account_number=${account}&selected_menu=$quizOrSurvay";
  }

  static final String API_Key_2 = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE2MTg4OTU1MjIsImp0aSI6IlRQSTVmdFFUeU5MR1ZLenFOZlVhYThyRURpdEJkRmpIS0ErUGVFMTFjMTg9IiwiaXNzIjoicHVsc2VzZXJ2aWNlc2Jk"+
  "LmNvbSIsImRhdGEiOnsidXNlcklkIjoiMjg4MTUiLCJ1c2VyTGV2ZWwiOjJ9fQ.wQ5AQR-fIGRZgt3CN9-W6v4PkvTIvNVP8HzCOiHHeKwcd8NT1R1Dxz_XpJH9jOa7CsDzCYBklEPRtQus11NiEQ";

  static final String API_KEY = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE2MTg4OTU1MjIsImp0aSI6IlRQSTVmdFFUeU5MR1ZLenFOZlVhYThyRURpdEJkRmpIS0ErUGVFMTFjMTg9IiwiaXNzIjoicHVsc2VzZXJ2aWNlc2JkLmNvbSIsImRhdGEiOnsidXNlcklkIjoiMjg4MTUiLCJ1c2VyTGV2ZWwiOjJ9fQ.wQ5AQR-fIGRZgt3CN9-W6v4PkvTIvNVP8HzCOiHHeKwcd8NT1R1Dxz_XpJH9jOa7CsDzCYBklEPRtQus11NiEQ";
  static final String API_KEY_2= "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE2MTg4OTU1MjIsImp0aSI6IlRQSTVmdFFUeU5MR1ZLenFOZlVhYThyRURpdEJkRmpIS0ErUGVFMTFjMTg9IiwiaXNzIjoicHVsc2VzZXJ2aWNlc2JkLmNvbSIsImRhdGEiOnsidXNlcklkIjoiMjg4MTUiLCJ1c2VyTGV2ZWwiOjJ9fQ.wQ5AQR-fIGRZgt3CN9-W6v4PkvTIvNVP8HzCOiHHeKwcd8NT1R1Dxz_XpJH9jOa7CsDzCYBklEPRtQus11NiEQ";

}
