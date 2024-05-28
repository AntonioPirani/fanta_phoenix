import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:prova1/utilities/constants.dart';
import 'package:prova1/screens/registration.dart';
import 'package:prova1/screens/password.dart';
import 'package:prova1/screens/home.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Future<Album> createAlbum(String email, String password) async {
  var response = await http.post( 'https://www.plogon.netsons.org/mobile/login.php', 
    //headers:{ "Content-Type":"multipart/form-data" } , 
    body: { 
    "email": email,
    "password": password}, 
    encoding: Encoding.getByName("utf-8") );
 //controllo status code 200 email o pw errati

  if (response.statusCode == 201) {
    //print(response.statusCode.toString());
    return Album.fromJson(json.decode(response.body));
  } 
  else {
    if (response.statusCode == 200){
      //String ritorno = "{'controllo': "+response.body.toString()+"}";
      return Album.controllo(response.body);
    }
    else{
      throw Exception('Errore nella connessione');
    }
  }
 //
}

class Album {
  final String id;
  final String nome;
  final String cognome;
  final String email;
  final String password;
  final String username;
  final String immagineProfilo;
  final DateTime dataNascita;
  final int numFollower;
  final int numSeguiti;
  final int numPost;
  String controllo;
  
  Album({this.id,this.nome,this.cognome, this.email, this.password, this.username, this.immagineProfilo, 
  this.dataNascita, this.numFollower, this.numSeguiti, this.numPost, this.controllo});

  factory Album.controllo(String controllo){
    //if(controllo != '1'){
      //print("Controllo è diverso da 1: "+controllo);
     //_MyAppState.alert();
   // }
    return Album(
      id: '0',
      nome: '0',
      cognome: '0',
      email: '0',
      password: '0',
      username: '0',
      immagineProfilo: '0',
      dataNascita: DateTime.now(),
      numFollower: 0,
      numSeguiti: 0,
      numPost: 0,
      controllo: controllo,
    );
  }

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['ID_utente'],
      nome: json['Nome'],
      cognome: json['Cognome'],
      email: json['Email'],
      password: json['Password'],
      username: json['Username'],
      immagineProfilo: json['Immagine_profilo'],
      dataNascita: DateTime.parse(json['Data_nascita']),
      numFollower: int.parse(json['Num_follower']),
      numSeguiti: int.parse(json['Num_seguiti']),
      numPost: int.parse(json['Num_post']),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //bool _rememberMe = false;
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPw = TextEditingController();
  Future<Album> _futureAlbum;

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
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _controllerPw,
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
      child: FlatButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordScreen())),
        padding: EdgeInsets.only(right: 0.0),
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
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: double.infinity,
      child: 
               Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      elevation: 5.0,
                      child: 
                        Text('Login',
                        style: TextStyle(
                        color: Color(0xFF527DAA),
                        letterSpacing: 1.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        ),),
                      onPressed: () {
                        setState(() {
                          if(_controllerEmail.text.isEmpty || _controllerPw.text.isEmpty){
                            Alert(
                              context: context,
                              //type: AlertType.error,
                              title: "Attenzione",
                              desc: "Compila tutti i campi per proseguire",
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
                          else{
                            
                            setState(() {
                               _futureAlbum = createAlbum(_controllerEmail.text, _controllerPw.text);
                            });
                          }
                        });
                      },
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.white,
                      ),
                  ],
                )
        );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen())),
      child: RichText(
        text: TextSpan(
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
      padding: EdgeInsets.symmetric(vertical: 10.0),
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
    return (_futureAlbum == null)
    ? WillPopScope(onWillPop: () async => false, 
    child: Scaffold(
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
                    vertical: 15.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/logoBianco.png',
                      width: 220,
                      height: 180,
                      ),
                      SizedBox(height: 30.0),
                      _buildEmailTF(),
                      SizedBox(
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
    ) 
    )
    :FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
      if (snapshot.hasData) {
        if(snapshot.data.controllo != null){

          return AlertDialog(
            title: Text("Attenzione",style: kLabelStyle2,
              textAlign: TextAlign.center,),
            contentTextStyle: kLabelStyle,
            shape: RoundedRectangleBorder(borderRadius: 
            BorderRadius.all(Radius.circular(15))),
            actions: <Widget>[
              Text(
              "Verifica di aver inserito correttamente i tuoi dati",
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
        return HomeScreen(
          id: snapshot.data.id,
          nome: snapshot.data.nome,
          cognome: snapshot.data.cognome,
          email: snapshot.data.email,
          password: _controllerPw.text,
          username: snapshot.data.username,
          immagineProfilo: snapshot.data.immagineProfilo,
          dataNascita: snapshot.data.dataNascita,
          numFollower: snapshot.data.numFollower,
          numSeguiti: snapshot.data.numSeguiti,
          numPost: snapshot.data.numPost,
          );
      }

    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }
    
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  },
);
    
  }
}