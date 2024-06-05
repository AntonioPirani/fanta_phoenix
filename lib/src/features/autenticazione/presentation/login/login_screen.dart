import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fanta_phoenix/src/features/autenticazione/presentation/login/index.dart';
import 'package:fanta_phoenix/src/features/autenticazione/presentation/password_dimenticata/password_dimenticata_screen.dart';
import 'package:fanta_phoenix/src/features/autenticazione/presentation/registrazione/registrazione_screen.dart';
import 'package:fanta_phoenix/src/common_widgets/index.dart';
import 'package:fanta_phoenix/src/features/home/presentation/navigazione_screen.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                      PasswordDimenticataButton(
                        passwordScreen: PasswordDimenticataScreen(),
                      ),
                      //RicordamiCheckbox(),
                      LoginButton(
                        navigazioneScreen: NavigazioneScreen(),
                      ),
                      SignupButton(
                        registrationeScreen: RegistrazioneScreen(),
                      ),
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