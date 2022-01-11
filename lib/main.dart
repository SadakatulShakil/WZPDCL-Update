import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'language/AppLocalizationsDelegate.dart';
import 'language/LocalConstant.dart';
import 'screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome?.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp2()));

 // runApp(MyApp2());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WZPDCL',
      //localization by nabila
      localizationsDelegates: [
        //AppLocalizations.delegate, // Add this line
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'), // English, no country code
        Locale('bn', 'BN'), // bangla, no country code
      ],
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFF2D3192),
        ),
      ),
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocaleLanguage in supportedLocales) {
          if (supportedLocaleLanguage.languageCode == locale!.languageCode &&
              supportedLocaleLanguage.countryCode == locale.countryCode) {
            return supportedLocaleLanguage;
          }
        }
        return supportedLocales.first;
      },
      home: StartingPage(),
    );
  }

//flutter packages pub run build_runner build
}

class MyApp2 extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp2> {
   Locale? _locale;


  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /* builder: (context, child) {
        return MediaQuery(
          child: child,
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },*/
      title: 'Multi Language',
      debugShowCheckedModeBanner: false,
      locale: _locale,
      home: StartingPage(),
      supportedLocales: [
        Locale('en', ''),
        Locale('bn', ''),
      ],
      theme: ThemeData(
        fontFamily: 'android',
        appBarTheme: AppBarTheme(
          color: Color(0xFF2D3192),
        ),
      ),
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }

  //https://medium.com/flutter-community/multi-language-support-in-flutter-a12de708f833
//https://github.com/KinjalDhamat312/MultiLanguageFlutter/blob/master/lib/screens/home.dart
}
