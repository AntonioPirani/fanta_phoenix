import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prova1/screens/login_screen.dart';
import 'package:prova1/utilities/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class PasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner:false,
      //title: _title,
      home: Scaffold(
        //appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }

}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

Future<Pass> createPass(String email) async {
  
  var response = await http.post( 'https://www.plogon.netsons.org/mobile/nuova_password.php', 
    body: { 
    "email": email,
    }, 
    encoding: Encoding.getByName("utf-8") );

  if (response.statusCode == 200) {
    return Pass.getRisposta(response.body);
  } 
  else {
      throw Exception('Errore nella connessione');
  }
}

class Pass{
  final String email;

  Pass({this.email});

  factory Pass.getRisposta(String r){
    return Pass(
      email: r,
    );
  }
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

final TextEditingController _controllerEmail = TextEditingController();

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _controllerEmail,
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
              hintText: 'Inserisci qui la tua email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  bool validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
  }
  Future<Pass> _futurePass;

  Widget _buildPasswordBtn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () { 
          if(validateEmail(_controllerEmail.text)){
            //print("Email valida");
            //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            
            setState(() {
              _futurePass = createPass(_controllerEmail.text);
            });
          }
          else{
            //print("Email NON valida");
            Alert(
              context: context,
              //type: AlertType.error,
              title: "Attenzione",
              desc: "Inserisci un formato email valido",
              buttons: [
                DialogButton(
                  child: Text(
                    "OK",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
                  width: 120,
                )
              ],
              ).show();
            }
          
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Recupera Password',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return (_futurePass == null)
    ? Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
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
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 70.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/logoBianco.png',
                      width: 220,
                      height: 180,
                      ),
                      Text(
                        'Recupera password',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordBtn(context),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    )
    :FutureBuilder<Pass>(
                      future: _futurePass,
                      builder: (context, snapshot2) {
                      if (snapshot2.hasData) { 
                        //controllo
                        if(snapshot2.data.email=="success"){
                          return AlertDialog(
                           title: Text("Successo",style: kLabelStyle2,
                              textAlign: TextAlign.center,),
                           contentTextStyle: kLabelStyle,
                           shape: RoundedRectangleBorder(borderRadius: 
                            BorderRadius.all(Radius.circular(15))),
                           actions: <Widget>[
                             Text(
                              "Controlla nella tua casella di posta se hai ricevuto un messaggio di recupero password",
                              style: kLabelStyle3,
                              textAlign: TextAlign.center,
                             ),
                             FlatButton(child: Text("OK"), onPressed: () {
                               //Navigator.of(context, rootNavigator: true).pop();
                               Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                             },),
                           ],
                         );
                        }
                        else{
                          return AlertDialog(
                           title: Text("Attenzione",style: kLabelStyle2,
                              textAlign: TextAlign.center,),
                           contentTextStyle: kLabelStyle,
                           shape: RoundedRectangleBorder(borderRadius: 
                            BorderRadius.all(Radius.circular(15))),
                           actions: <Widget>[
                             Text(
                              "Non è associato nessun account a questa email",
                              style: kLabelStyle3,
                              textAlign: TextAlign.center,
                             ),
                             FlatButton(child: Text("OK"), onPressed: () {
                               //Navigator.of(context, rootNavigator: true).pop();
                               Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordScreen()));
                             },),
                           ],
                         );
                        }

                    } else if (snapshot2.hasError) {
                      return Text("${snapshot2.error}");
                    }
                    
                    return CircularProgressIndicator();
                  },
                );
  }
}