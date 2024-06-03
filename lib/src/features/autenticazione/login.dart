import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fanta_phoenix/src/features/autenticazione/presentation/login/index.dart';
import 'package:fanta_phoenix/src/common_widgets/motto_text.dart';
//import 'package:prova1/screens/registration.dart';
//import 'package:prova1/screens/password.dart';
//import 'package:prova1/screens/home.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  //bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.indigo, // indigo - amber
                        Colors.lime,   // lime   - red
                      ],
                      stops: [0.1, 0.9],
                    ),
                  ),
                ),
                const SizedBox(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 15.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 30.0,
                        ),
                        TitoloText(),
                        LogoImage(),
                        SizedBox(
                          height: 30.0,
                        ),
                        EmailTextField(),
                        SizedBox(
                          height: 30.0,
                        ),
                        PasswordTextfield(),
                        PasswordDimenticataButton(),
                        //RicordamiCheckbox(),
                        LoginButton(),
                        SignupButton(),
                        SizedBox(
                          height: 40.0,
                        ),
                        MottoText()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
}