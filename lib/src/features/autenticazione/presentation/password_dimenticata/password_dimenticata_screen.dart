import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fanta_phoenix/src/features/autenticazione/presentation/password_dimenticata/index.dart';
import 'package:fanta_phoenix/src/common_widgets/index.dart';

class PasswordDimenticataScreen extends StatefulWidget {
  const PasswordDimenticataScreen({super.key});
  
  @override
  State<PasswordDimenticataScreen> createState() => _PasswordDimenticataScreenState();
}

class _PasswordDimenticataScreenState extends State<PasswordDimenticataScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ! come per la registrazione valutare se usare la appBar
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
                    vertical: 15.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: TornaAlLoginButton()
                      ),
                      RecuperaPasswordText(),
                      SizedBox(height: 50.0),
                      EmailTextField(),
                      SizedBox(height: 50.0),
                      RecuperaPasswordButton(),
                      SizedBox(height: 250.0),
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