import 'package:flutter/material.dart';
class ManageAccount extends StatefulWidget {
  const ManageAccount({Key? key}) : super(key: key);

  @override
  _ManageAccountState createState() => _ManageAccountState();
}

class _ManageAccountState extends State<ManageAccount> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Container(
        width: 360.0,
        height: 557.0,
        child: ClipRRect(
          borderRadius: BorderRadius.zero,
          child: Container(
            color: Color.fromARGB(255, 246, 246, 246),
              child:
              Padding(
                padding: const EdgeInsets.only(top:17.0,left: 10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit:BoxFit.contain,
                        child: Text(
                          '''Manage Account''',
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 1.171875,
                            fontSize: 20.0,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 45, 49, 146),

                            /* letterSpacing: 0.0, */
                          ),
                        ),
                      ),
                      SizedBox(
                        height:17,
                      ),
                  FittedBox(
                    fit:BoxFit.contain,
                    child: RichText(
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.left,
                        text: const TextSpan(
                          style: TextStyle(
                            height: 3.205227533976237,
                            fontSize: 12.0,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 99, 99, 99),

                            /* letterSpacing: 0.0, */
                          ),
                          children: [
                            TextSpan(
                              text: '''Primary Mobile Number:   ''',
                            ),
                            TextSpan(
                              text: '''01652369583
''',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,

                                /* letterSpacing: null, */
                              ),
                            )
                          ],
                        ),
                    ),
                  ),
                    ],
                  ),
                ),
              ),
          ),
        ),
      ),
    );
  }
}
