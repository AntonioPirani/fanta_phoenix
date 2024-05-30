import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fanta_phoenix/src/utils/style.dart';
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

  // TODO spostare questi widget in un altro file

  // BuildEmail TextField
  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Email',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: const TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Inserisci la tua Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Password',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: const TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),  
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Inserisci la tua Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: const TextButton(
        // onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordScreen())),
        onPressed: null,
        // padding: const EdgeInsets.only(right: 0.0),
        child: Text(
          'Password dimenticata?',
          style: kLabelStyle,
        ),
      ),
    );
  }
  /*
  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }*/

  Widget _buildLoginBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      width: double.infinity,
      child: 
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              //elevation: 5.0,
              // onPressed: () {
              //   setState(() {
              //     if(_controllerEmail.text.isEmpty || _controllerPw.text.isEmpty){
              //       Alert(
              //         context: context,
              //         //type: AlertType.error,
              //         title: "Attenzione",
              //         desc: "Compila tutti i campi per proseguire",
              //         buttons: [
              //           DialogButton(
              //             child: const Text(
              //               "OK",
              //             style: TextStyle(color: Colors.white, fontSize: 20),
              //             ),
              //             onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
              //             width: 120,
              //           )
              //         ],
              //         ).show();
              //     }
              //     else{
                    
              //       setState(() {
              //           _futureAlbum = createAlbum(_controllerEmail.text, _controllerPw.text);
              //       });
              //     }
              //   });
              // },
              onPressed: null,
              //padding: const EdgeInsets.all(15.0),
              //shape: RoundedRectangleBorder(
              //borderRadius: BorderRadius.circular(30.0),
              //),
              //color: Colors.white,
              child: 
                Text('Login',
                style: TextStyle(
                  color: Color(0xFF527DAA),
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                  ),
                ),
            ),
          ],
        )
      );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen())),
      onTap: null,
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: '\nNon hai un account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Registrati',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMottoText(){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '\n"Go Plog, live long"',
              style: TextStyle(
                color: Colors.blueGrey[700],
                //color: Color(0xFF04223D),
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]
        ),
      ),
    );
  }

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
                        Color(0xFF04223D),
                        Colors.greenAccent,
                      ],
                      stops: [0.1, 0.9],
                    ),
                  ),
                ),
                SizedBox(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 15.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/icons/traffic-light.png',
                          width: 220,
                          height: 180,
                        ),
                        const SizedBox(height: 30.0),
                        _buildEmailTF(),
                        const SizedBox(
                          height: 30.0,
                        ),
                        _buildPasswordTF(),
                        _buildForgotPasswordBtn(),
                      //_buildRememberMeCheckbox(),
                        _buildLoginBtn(),
                        _buildSignupBtn(),
                        _buildMottoText(),
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