import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:launch_review/launch_review.dart';
import 'package:share/share.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';
import 'package:wzpdcl_app_flutter/language/LocalConstant.dart';
import 'package:wzpdcl_app_flutter/screens/CustomerGuideLine.dart';
import 'package:wzpdcl_app_flutter/screens/user_login_screen.dart';
import 'package:wzpdcl_app_flutter/utils/AppConstant.dart';
import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';

enum PopUpNavMenu {
  SwitchToBangla,
  Notification,
  Message,
  ShareThisApp,
  CustomerGuide,
  PrivacyPolicy,
  SocialMedia,
  RateThisApp,
  LogOut
}
List <PopUpNavMenu>items = PopUpNavMenu.values;

void choiceAction(context, choice) async {

  if(PopUpNavMenu.ShareThisApp == choice){
    await Share.share("www.google.com", subject: "App");
  /*  Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoginPage();
    }));
*/
  }else if (PopUpNavMenu.Notification == choice) {
    CommonOperation.snackbar(context: context);
  } else if (PopUpNavMenu.Message == choice) {
    CommonOperation.snackbar(context: context);
  } else if(PopUpNavMenu.SwitchToBangla == choice){
    print('SwitchToBangla');
    print('SwitchToBangla');

    if(Languages.of(context)!.switchLanguage == "English"){
      changeLanguage(context, 'en');
    }else{
      changeLanguage(context, 'bn');
    }

  }else if(PopUpNavMenu.CustomerGuide == choice){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => CustomerGuideLine()));

  }else if(PopUpNavMenu.PrivacyPolicy == choice){
    CommonOperation.openNewWebview(context, AppConstant.PRIVACY_POLICY_URL);
  }else if(PopUpNavMenu.SocialMedia == choice){
    //CommonOperation.openNewWebview(context, AppConstant.SM);
    CommonOperation.showDialogSocial(context);
  }else if(PopUpNavMenu.RateThisApp == choice){
    LaunchReview.launch();
    //CommonOperation.openNewWebview(context, AppConstant.App_URL);
  }else if(PopUpNavMenu.LogOut == choice){
    CommonOperation.resetAndOpenPage(context,CommonMenu() );
  }
}

class MyCustomAppBar extends AppBar {
  MyCustomAppBar(
      {required BuildContext context,
      Key? key,
      Widget? leading,
      Widget? title,
      bool? centerTitle,
      List<Widget>? actions})
      : super(
            key: key,
            leading: MaterialButton(
              onPressed: (){
               // Navigator.push(context, MaterialPageRoute(builder: (context)=> CommonMenu()));
              },
              /*child: Icon(
                Icons.home,
                color: Colors.white,
              ),*/
            ),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.bolt,
                    color: Colors.white,
                  ),
                  Text('WZPDCL'),
                ]),
            centerTitle: true,
            actions: [
              PopupMenuButton<PopUpNavMenu>(
                color: Colors.white.withOpacity(0.9),
                elevation: 6.0,
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                  offset: Offset(0,40),
                  onSelected: (item) {
                    //TODO: go to the chosen page
                    choiceAction(context, item);
                  },
                  icon: Icon(Icons.menu),
                  itemBuilder: (context) {
                    return [

                      PopupMenuItem(
                        child: menuItem(
                          //lanEn ? 'Switch to Bangla' : 'Switch to English',
                            Languages.of(context)!.switchLanguage,
                            'language2.svg'),
                        value: PopUpNavMenu.SwitchToBangla,
                      ),

                      PopupMenuItem(
                        child: menuItem(Languages.of(context)!.Notification,
                            'notification.svg'),
                        value: PopUpNavMenu.Notification,
                      ),
                      PopupMenuItem(
                        child: menuItem(
                            Languages.of(context)!.Message, 'message.svg'),
                        value: PopUpNavMenu.Message,
                      ),
                      PopupMenuItem(
                        child: menuItem(Languages.of(context)!.ShareThisApp, 'share.svg'),
                        value: PopUpNavMenu.ShareThisApp,
                      ),
                      PopupMenuItem(
                        child: menuItem(Languages.of(context)!.CustomerGuide, 'guide.svg'),
                        value: PopUpNavMenu.CustomerGuide,
                      ),
                      PopupMenuItem(
                        child: menuItem(Languages.of(context)!.PrivacyPolicy, 'policy.svg'),
                        value: PopUpNavMenu.PrivacyPolicy,
                      ),
                      /*PopupMenuItem(
                        child: menuItem('Admin Log In', 'admin.svg'),
                        value: PopUpNavMenu.AdminLogIn,
                      ),*/
                      PopupMenuItem(
                        child: menuItem(Languages.of(context)!.SocialMedia, 'social.svg'),
                        value: PopUpNavMenu.SocialMedia,

                      ),
                      PopupMenuItem(
                        child: menuItem(Languages.of(context)!.RateApp, 'star.svg'),
                        value: PopUpNavMenu.RateThisApp,
                      ),
                     /* PopupMenuItem(
                        child: menuItem('Manage Account', 'manage.svg'),
                        value: PopUpNavMenu.ManageAccount,
                      ),*/
                      PopupMenuItem(
                        child: menuItem(Languages.of(context)!.LogOut, 'logout.svg'),
                        value: PopUpNavMenu.LogOut,
                      ),
                    ];
                  })
            ]);
}

Widget menuItem(String text, String assetName){
  // TODO: Change the shape
  return Container(
    // decoration: BoxDecoration(
    //   boxShadow: [
    //     BoxShadow(
    //         color: Colors.grey, offset: Offset(2.0, 2.0))
    //   ],
    //   border:
    //   Border.symmetric(horizontal: BorderSide(color: Colors.grey),),
    //   shape: BoxShape.rectangle,
    // ),
    width: 900,
    child: Row(children: [
        SvgPicture.asset('assets/vectors/nav_menu/$assetName',height: 20,width: 20,),
    SizedBox(width: 24.08,),
    Text(text),
  ]));
}

// Row(children: [
// SvgPicture.asset('assets/vectors/menu/notification.svg'),
// SizedBox(width: 24.08,),
// Text('Notification'),
// ],),