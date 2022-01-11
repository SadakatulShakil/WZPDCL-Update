import 'package:flutter/material.dart';
const kSignUpUrl = 'http://27.147.146.251:9998/Application/Apply';
const kApplyNewConnectionUrl = 'http://27.147.146.251:9998/';

enum newConnectionValidation{
  trackEmpty,
  pinEmpty,
  wrongTrackLength,
  wrongPinLength,
  Correct,
}

enum loginValidation{
  customerNoEmpty,
  mobileNoEmpty,
  wrongCustomerNoLength,
  wrongMobileNoLength,
  Correct
}



const String kGuestPageVectorPath = 'assets/vectors/guests/';
const String kCommonMenuVectorPath = 'assets/vectors/';


const kForgotPasswordStyle = Text(
  'Forgot your password?',
  style: TextStyle(
      color: Color(0XFF2D3192), fontSize: 16.0, fontWeight: FontWeight.w600),
);

// Officer Contact List Screen Constants
const kOCLTextStyle = TextStyle(fontWeight: FontWeight.w600);

// Officer Contact List Screen Retrieve Pin
const kTableHeadTextStyle = TextStyle(
    fontWeight: FontWeight.bold, color: Color(0xFF646464), fontSize: 16.0);


const kTableBodyTextStyle = TextStyle(color: Color(0xFF646464), fontSize: 16.0);
const kCustomerComplaintStatistics=TextStyle(
  color: Color(0xFFFFFFFF),fontSize: 20,fontWeight: FontWeight.w600,height: 24.2,
);
const kComplaintSubmitted=TextStyle(fontSize: 13,color:Color(0xFFFFFF),fontWeight: FontWeight.w700,height: 15.73);
const kComplaintTableBody=TextStyle(fontSize: 12,color:Color(0x000000),fontWeight: FontWeight.w400,height: 21);

const kComplaintEntryHintText=TextStyle(
    fontSize: 14,color:Color(0x969696),fontWeight: FontWeight.w400,height: 16.94,);
const kCustomerComplaintTabBarText=TextStyle(
height: 1.171875,
fontSize: 13.0,
fontFamily: 'Inter',
fontWeight: FontWeight.w700,
color: Color.fromARGB(255, 255, 255, 255));
const kCustomerComplaintDataTable=TextStyle(
  height: 1.75,
  fontSize: 12.0,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w400,
  color: Color.fromARGB(255, 0, 0, 0),
);
const kComplaintStat=TextStyle(
  height: 1.171875,
  fontSize: 20.0,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w400,
  color: Color.fromARGB(255, 255, 255, 255),
);
const kFeederComplaintDataTableLeftText=TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w500,
);
const kLedgerLargeScreenStatGreenContainerText=TextStyle(
 // height: 1.3152272701263428,
  height:1.6,
  fontSize: 14.0,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w400,
  color: Color.fromARGB(255, 255, 255, 255),

  /* letterSpacing: 0.0, */
);