import 'dart:convert';
import 'Languages .dart';

class LanguageEn extends Languages {

  String get appName => "Multi-languages";
  String get labelWelcome => "Welcome";
  String get labelSelectLanguage => "Select Language";
  String get labelInfo => "This is multi-languages demo application";
  String get login => "Log In";
  String get signup => "Sign up";
  String get switchLanguage => "বাংলা";
  String get AdminLogIn => "Admin Log In";
  String get ApplyNewConnection => 'New\nConnection';
  String get CustomerGuideline => 'Customer\nGuideline';
  String get OfficerInfo => 'Officer\nInfo';
  String get CallCenter => 'Call\nCenter';
  String get OfficerLocation => 'Office\nLocation';
  String get Faq => 'FAQ';
  String get Enter9DigitCustomerNo => 'Enter 9 Digit Customer No.';
  String get EnterValidMobileNo => 'Enter Valid Mobile No.';
  String get or => 'or';
  String get PleasewaitLoginProcessing => 'Please wait.\nLogin Processing....';
  String get Error => 'Error!!!';
  String get PleaseProvideCcorrectInformation => 'Please Provide the correct Information';
  String get EmptyField => 'Write something here';
  String get Email => 'Email';
  String get Password => 'Password';
  String get ForgotPassword => 'Forgot your password?';
  String get WelcomeWZPDCLCustomeService => 'Welcome to WZPDCL Customer Service';
  String get TryAgain => 'Try Again';
  String get VerifyPhone => 'Verify Phone';
  String get WeSentCodeToVerify => 'We sent you a code\nto verify your number.';
  String get SentTo  => 'Sent to ';
  String get Code  => 'Code';
  String get VERIFY  => 'VERIFY';
  String get ShareThisApp  => 'Share This App';
  String get CustomerGuide  => 'Customer Guide';
  String get PrivacyPolicy  => 'Privacy & Policy';
  String get SocialMedia  => 'Social Media';
  String get RateApp  => 'Rate this App';
  String get LogOut  => 'Log Out';
  String get Notification  => 'Notification';
  String get Message  => 'Message';
  String get ManageAccount  => 'Manage Account';
  String get CustomerName  => 'Customer Name';
  String get MeterNo  => 'Meter No : ';
  String get MobileNo  => 'Mobile No';
  String get CustomerNo  => 'Customer No';
  String get PayBill  => 'Pay Bill';
  String get ticketCreation => 'Ticket Created Successfully !';
  String get ticketCreationFail => 'Ticket Creation Failed !';
  String get LedgerNusuage  => 'Leadger &\nusuage';
  String get BillCalculator  => 'Bill\nCalculator';
  String get ManageAccount_  => 'Manage\nAccount';
  String get DailComplaint  => 'Dail\nComplaint';
  String get ComplaintList  => 'Complaint\nList';
  String get SupportEmail  => 'Support\nEmail';
  String get Survey  => 'Survey';
  String get signUp => 'Sign up';
  String get account => 'Account Number';
  String get mobile => 'Mobile Number';
  String get e_mail => 'Email Address';
  String get signup_btn => 'Sign Up';
  String get validedEmail => 'Insert Email !';
  String get name => 'Name';
  String get chooseMobileNumber  => 'Write Mobile Number';
  String get chooseAccountNumber  => 'Choose Specific Customer Account No.';
  String get chooseComplain  => 'Choose a Complaint';
  String get chooseComplainCategory  => 'Choose a Complaint Category';
  String get writeMessage  => 'Write a Message (optional)';
  String get faultAddress  => 'Fault Address (optional)';
  String get uploadFile  => 'Upload File';
  String get submitComplaint  => 'Submit Complaint';
  String get PleasewaitProcessing => 'Please wait !';
  String get validedCustomerNo => 'Please select Customer number !';
  String get validedMobileNo => 'Please input a Mobile number !';
  String get validedComplainType => 'Please select Complain Type !';
  String get validedComplain => 'Please select Complain !';
  String get UpdateNews  => 'Update\nNews';
  String get Quiz  => 'Quiz';
  String get UserId  => 'User Id :';
  String get UnitOffice   => 'Unit Office : ';
  String get Feeder   => 'Feeder : ';
  String get ComplaintDashboard   => 'Complaint\nDashboard';
  String get NewConnectionDashboard   => 'New Connection\nDashboard';
  String get ChecknBill   => 'Check\nBill';
  String get MasterDataUpdate   => 'Master Data\nUpdate';
  String get PinRetrieval   => 'Pin\nRetrieval';
  String get StatusCheckPayment   => 'Status Check \n& Payment';
  String get TrackingNoRetrieval   => 'Tracking No. \nRetrieval';
  String get PleaseEnter17digitTrackingNumber   => 'Please Enter your 17 or more digit Tracking Number';
  String get PleaseEnter6digitPinNumber   => 'Please enter your 6 digit Pin Number';
  String get PinTrackError   => 'Pin or Track Error';
  String get PleaseProvideCorrectPINTrackNumber   => 'Please provide the correct PIN or Track Number';
  String get NewConnectionStatusCheckPayment   => 'New Connection Status\nCheck & Payment';
  String get TrackingNumber   => 'Tracking Number';
  String get PinNumber   => 'Pin Number';
  String get CheckStatusMakePayment   => 'Check Status & Make Payment';
  String get ApplicantName   => 'Applicant Name';
  String get NewConnectionStatus   => 'New Connection Status';
  String get GoToPayment   => 'Go To Payment';
  String get StatusName   => 'Status Name';
  String get DocumentsReceived   => 'Documents Received';
  String get CreateANewComplaint   => 'Create A New Complaint';
  String get ComplaintStatistics   => 'Complaint Statistics';
  String get Submission   => 'Submission';
  String get Progress   => 'Progress';
  String get Solved   => 'Solved';
  String get ComplaintID   => 'Complaint ID';
  String get SubmitDate   => 'Submit Date';
  String get ContactNo   => 'Contact No';
  String get FaultAddress   => 'Fault Address';
  String get Complaint   => 'Complaint';
  String get FaultLocation   => 'FaultLocation';
  String get ViewMap   => 'View Map';
  String get File   => 'File';
  String get ViewFile   => 'View File';
  String get Instructions   => 'Instructions';
  String get ActionTakenTime   => 'Action Taken Time';
  String get Feedback   => 'Feedback';
  String get AccountNo   => 'Account No : ';
  String get Tarrif   => 'Tarrif : ';
  String get SanctionLoad   => 'Sanction Load : ';
  String get DueBills   => 'Due Bills';
  String get PaidBills   => 'Paid Bills';
  String get BillNumber   => 'Bill Number';
  String get IssueDate   => 'Issue Date';
  String get PreviousRating   => 'Previous Rating';
  String get Consumptions   => 'Consumptions';
  String get TransactionId   => 'Transaction Id';
  String get Month   => 'Month';
  String get LastDate   => 'Last Date';
  String get PresentingRating   => 'Present Rating';
  String get BDT   => 'BDT';
  String get ViewBill   => 'View Bill';
  String get Ledger   => 'Ledger';
  String get UsageGraph   => 'Usage Graph';
  String get BillMonth   => 'Bill Month';
  String get DueDate   => 'Due Date';
  String get PayDate   => 'Pay Date';
  String get CurrentBill   => 'Current Bill';
  String get TotalBill   => 'Total Bill';
  String get PaidAmount   => 'Paid Amountl';
  String get BarChart   => 'BarChart';
  String get Last12MonthsUsageBarChart   => 'Last 12 Months Usage Bar Chart';
  String get UnitConsumedBarChart   => 'Unit Consumed Bar Chart';
  String get ComingSoon   => 'Coming Soon...';
  String get CustomerGuideline_   => 'Customer Guideline';
  String get OfficeContactList   => 'Officer Contact List';
  String get Name   => 'Name';
  String get Designation   => 'Designation';
  String get Mobile   => 'Mobile';
  String get Responsibilities   => 'Responsibilities';
  String get OfficeLocationMap   => 'Office Location Map';
  String get Address   => 'Address';
  String get OfficePhone   => 'Office Phone';
  String get OfficeEmail   => 'Office Email';
  String get Website   => 'Website';
  String get NewsUpdate   => 'News Update';
  String get FeederInchargeID   => 'Feeder Incharge ID';
  String get Inbox   => 'Inbox';
  String get Response   => 'Response';
  String get TakeAction   => 'Take Action';
  String get Solve   => 'Solve';
  String get FeederName   => 'Feeder Name';
  String get SolvedTime   => 'Solved Time';
  String get Customerfeedback   => 'Customer feedback';
  String get WestZonePowerDistributionCompanyLimited   => 'West Zone Power Distribution Company Limited';
  String get DataLoading   => 'Data Loading....';
  String get InvalidCode   => 'Invalid Code';
  String get PleaseWaitFor    => 'Please wait for ';
  String get Second    => 'Second ';
  String get ResendSMS    => 'Resend Code';
  String get Codeissending    => 'Code is sending....';
  String get CodeSent    => 'Code Sent';
  String get PleaseWriteCode    => 'Please Write Code';
  String get SelectFeederIncharge    => 'Select Feeder Incharge';
  String get LastMonth    => 'Last Month';
  String get Billstatus    => 'Bill Status';
  String get TotalAmount    => 'Total Amount';
  String get LocationCode    => 'Location Code';
  String get PaidMonth    => 'Paid Month';
  String get VatAmount    => 'Vat Amount';
  String get electricityAct    => 'Electricity Act, 2018';

}
