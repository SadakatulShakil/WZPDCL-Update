import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';
import 'package:wzpdcl_app_flutter/screens/customer_home_screen.dart';
import 'package:wzpdcl_app_flutter/screens/user_login_screen.dart';
import 'package:wzpdcl_app_flutter/utils/AppConstant.dart';



/// This screen is the Welcome Screen with Animation. This Widget is complete
/// It requires no changes the animation controller timing can be changed if required
///
class StartingPage extends StatefulWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  _StartingPageState createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage>
    with TickerProviderStateMixin {
  /// This class builds the animation page of the WZPDCL app.
  late AnimationController controller;
  late Animation animationIcon1;
  late Animation animationIcon2;
  late Animation animationIcon3;
  bool? isLoged;
  List<String>? customerNoList;

  /// Animation [controller] is initialized and duration of 5 seconds is used
  /// [ColorTween] animation is used for all the thunder icon
  @override
  void initState() {
    //getSharedValue();
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animationIcon1 = ColorTween(begin: Color(0xFF2D3192), end: Colors.white)
        .animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.35, curve: Curves.decelerate)));
    animationIcon2 = ColorTween(begin: Color(0xFF2D3192), end: Colors.white)
        .animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.35, 0.7, curve: Curves.decelerate)));
    animationIcon3 = ColorTween(begin: Color(0xFF2D3192), end: Colors.white)
        .animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.7, 1.0, curve: Curves.decelerate)));
    endAnimationAndNavigate();
    controller.addListener(() {
      setState(() {
      });
    });
  }

  /// Waits for the animation to complete and then the Home page is pushed
  void endAnimationAndNavigate() async{
    try{
      await controller.forward();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return CommonMenu();
      }));
    }catch(e){
      print(e);
    }
  }

  void endAnimationAndNavHome() async{
    try{
      await controller.forward();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CustomerHomeScreen(customerNo: customerNoList)));
    }catch(e){
      print(e);
    }
  }

  /// Disposes the controller so that it does not consume ram in the backend
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D3192),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/unnamed1.png'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 200.0,
                    child: Text(
                      Languages.of(context)!.WelcomeWZPDCLCustomeService,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bolt,
                    size: 50,
                    color: animationIcon1.value,
                  ),
                  Icon(
                    Icons.bolt,
                    size: 50,
                    color: animationIcon2.value,
                  ),
                  Icon(
                    Icons.bolt,
                    size: 50,
                    color: animationIcon3.value,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void getSharedValue() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoged = prefs.getBool(AppConstant.IS_LOGGED_IN);
    customerNoList = prefs.getStringList("accNoList")!;

    setState(() {
      if(isLoged!){
        endAnimationAndNavHome();
      }else{
        endAnimationAndNavigate();
      }
    });
  }


}
