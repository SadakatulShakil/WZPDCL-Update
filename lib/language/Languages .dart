import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class Languages {

  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get appName;
  String get labelWelcome;
  String get labelInfo;
  String get labelSelectLanguage;
  String get login;
  String get signup;
  String get switchLanguage;
  String get AdminLogIn;
  String get ApplyNewConnection;
  String get CustomerGuideline;
  String get OfficerInfo;
  String get CallCenter;
  String get OfficerLocation;
  String get Faq;
  String get Enter9DigitCustomerNo;
  String get EnterValidMobileNo;
  String get or;
  String get PleasewaitLoginProcessing;
  String get PleasewaitProcessing;
  String get validedCustomerNo;
  String get validedMobileNo;
  String get validedComplainType;
  String get validedComplain;
  String get validedEmail;
  String get Error;
  String get signUp;
  String get account;
  String get mobile;
  String get e_mail;
  String get signup_btn;
  String get PleaseProvideCcorrectInformation;
  String get EmptyField;
  String get Email;
  String get Password;
  String get ForgotPassword;
  String get WelcomeWZPDCLCustomeService;
  String get TryAgain;
  String get VerifyPhone;
  String get WeSentCodeToVerify;
  String get SentTo;
  String get Code;
  String get VERIFY;
  String get ShareThisApp;
  String get CustomerGuide;
  String get PrivacyPolicy;
  String get SocialMedia;
  String get RateApp;
  String get LogOut;
  String get Notification;
  String get Message;
  String get ManageAccount;
  String get CustomerName;
  String get MeterNo;
  String get ticketCreation;
  String get ticketCreationFail;
  String get chooseMobileNumber;
  String get chooseAccountNumber;
  String get chooseComplain;
  String get chooseComplainCategory;
  String get writeMessage;
  String get faultAddress;
  String get uploadFile;
  String get submitComplaint;
  String get electricityAct;
  String get MobileNo;
  String get CustomerNo;
  String get PayBill;
  String get LedgerNusuage;
  String get BillCalculator;
  String get ManageAccount_;
  String get DailComplaint;
  String get ComplaintList;
  String get SupportEmail;
  String get Survey;
  String get UpdateNews;
  String get Quiz;
  String get UserId;
  String get UnitOffice ;
  String get Feeder;
  String get ComplaintDashboard;
  String get NewConnectionDashboard;
  String get ChecknBill;
  String get MasterDataUpdate;
  String get PinRetrieval;
  String get StatusCheckPayment;
  String get TrackingNoRetrieval;
  String get PleaseEnter17digitTrackingNumber;
  String get PleaseEnter6digitPinNumber;
  String get PinTrackError;
  String get PleaseProvideCorrectPINTrackNumber;
  String get NewConnectionStatusCheckPayment;
  String get TrackingNumber;
  String get PinNumber;
  String get CheckStatusMakePayment;
  String get ApplicantName;
  String get NewConnectionStatus;
  String get GoToPayment;
  String get StatusName;
  String get DocumentsReceived;
  String get CreateANewComplaint;
  String get ComplaintStatistics;
  String get Submission;
  String get Progress;
  String get Solved;
  String get ComplaintID;
  String get SubmitDate;
  String get ContactNo;
  String get FaultAddress;
  String get Complaint;
  String get FaultLocation;
  String get ViewMap;
  String get File;
  String get ViewFile;
  String get Instructions;
  String get ActionTakenTime;
  String get Feedback;
  String get AccountNo;
  String get Tarrif;
  String get SanctionLoad;
  String get DueBills;
  String get PaidBills;
  String get BillNumber;
  String get IssueDate;
  String get PreviousRating;
  String get Consumptions;
  String get TransactionId;
  String get Month;
  String get LastDate;
  String get PresentingRating;
  String get BDT;
  String get ViewBill;
  String get Ledger;
  String get UsageGraph;
  String get BillMonth;
  String get DueDate;
  String get PayDate;
  String get CurrentBill;
  String get TotalBill;
  String get PaidAmount;
  String get BarChart;
  String get Last12MonthsUsageBarChart;
  String get UnitConsumedBarChart;
  String get ComingSoon;
  String get CustomerGuideline_;
  String get OfficeContactList;
  String get Name;
  String get Designation;
  String get Mobile;
  String get Responsibilities;
  String get OfficeLocationMap;
  String get Address;
  String get OfficePhone;
  String get OfficeEmail;
  String get Website;
  String get NewsUpdate;
  String get FeederInchargeID;
  String get Inbox;
  String get Response;
  String get TakeAction;
  String get Solve;
  String get FeederName;
  String get SolvedTime;
  String get Customerfeedback;
  String get WestZonePowerDistributionCompanyLimited;
  String get DataLoading;
  String get InvalidCode;
  String get PleaseWaitFor;
  String get Second;
  String get ResendSMS;
  String get Codeissending;
  String get CodeSent;
  String get PleaseWriteCode;
  String get SelectFeederIncharge;

  String get LastMonth;
  String get Billstatus;
  String get TotalAmount;
  String get LocationCode;
  String get PaidMonth;
  String get VatAmount;





}
