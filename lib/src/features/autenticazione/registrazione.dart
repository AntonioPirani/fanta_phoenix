import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fanta_phoenix/src/features/autenticazione/presentation/registrazione/index.dart';
import 'package:fanta_phoenix/src/common_widgets/motto_text.dart';

class RegistrazioneScreen extends StatefulWidget {
  const RegistrazioneScreen({super.key});
  
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<RegistrazioneScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(  // ! mettendo l'appBar compare anche il bottone per andare indietro, non serve quindi mettere IndietroButton(), però lasciando così sembra più carino
      //   title: const Text('Registrazione'),
      // ),
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
                      Colors.indigo,
                      Colors.lime,
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
                    vertical: 30.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: IndietroButton()
                      ),
                      RegistrazioneText(),
                      SizedBox(height: 20.0),
                      NomeTextfield(),
                      SizedBox(height: 20.0),
                      CognomeTextfield(),
                      SizedBox(height: 20.0),
                      EmailTextfield(),
                      SizedBox(height: 20.0),
                      PasswordTextfield(),
                      SizedBox(height: 20.0),
                      ConfermaPasswordTextfield(),
                      SizedBox(height: 20.0),
                      RegistrazioneButton(),
                      SizedBox(height: 20.0),
                      MottoText()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}