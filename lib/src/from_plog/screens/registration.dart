import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prova1/screens/login_screen.dart';
//import 'package:prova1/screens/login_screen.dart';
import 'package:prova1/utilities/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
//import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class RegistrationScreen extends StatelessWidget {

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

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Basic date field (${format.pattern})'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2020));
        },
      ),
    ]);
  }
}

Future<Utente> createUtente(String nome, String cognome, String email, String password, String conferma, String username, String data, String paese) async {

  var response = await http.post( 'https://www.plogon.netsons.org/mobile/registrazione.php', 
    body: { 
      "nome": nome,
      "cognome": cognome,
      "email": email,
      "password": password,
      "conferma_pwd": conferma,
      "username":username,
      "data_nascita": data,
      "country": paese,
      }, 
    encoding: Encoding.getByName("utf-8") );

  if (response.statusCode == 201) {
    return Utente.getRisposta(response.body);
  } 
  
    else{
      throw Exception('Errore nella connessione');
    }
  }


class Utente{
  final String risposta;

  Utente({this.risposta});

  factory Utente.getRisposta(String s){
    return Utente(
      risposta: s,
    );
  }
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  final TextEditingController _controllerNome = TextEditingController();  

  Widget _buildNomeTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nome',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _controllerNome,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.perm_identity,
                color: Colors.white,
              ),
              hintText: 'Inserisci qui il tuo Nome',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  
  final TextEditingController _controllerCognome = TextEditingController();

  Widget _buildCognomeTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Cognome',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _controllerCognome,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: 'Inserisci qui il tuo Cognome',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  final TextEditingController _controllerUsername = TextEditingController();

  Widget _buildUsernameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Username',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _controllerUsername,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              hintText: 'Inserisci qui il tuo Username',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }


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
              hintText: 'Inserisci qui la tua Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  final TextEditingController _controllerPassword = TextEditingController();

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
            controller: _controllerPassword,
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
              hintText: 'Inserisci qui la tua Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  
  final TextEditingController _controllerConferma = TextEditingController();

  Widget _buildConfirmPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Conferma Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _controllerConferma,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.vpn_key,
                color: Colors.white,
              ),
              hintText: 'Conferma la tua Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  } 
final TextEditingController _controllerData = new TextEditingController();
final format = DateFormat("yyyy-MM-dd");
 
  Widget _buildData(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Text('Data di Nascita', style: kLabelStyle,),
      SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: DateTimeField(
           format: format,
           style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
           controller: _controllerData,
           decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.today,
                color: Colors.white,
              ),
              hintText: 'Scegli la Data di Nascita',
              hintStyle: kHintTextStyle,
            ),
            onShowPicker: (context, currentValue) async {
            final date = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime.now());
            if (date != null) {
              return date;
            } else {
               return currentValue;
            }
          },
         ),
      ),
    ]);
  }

final TextEditingController _controllerPaese = TextEditingController(); 

  Widget _buildPaeseTF(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Paese',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _controllerPaese,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.explore,
                color: Colors.white,
              ),
              hintText: 'Scegli o scrivi il tuo paese',
              hintStyle: kHintTextStyle,
            ), 
            
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          width: double.infinity,
          child: DropdownButton(
          value: dropdownValue,
          items: paesi.map<DropdownMenuItem<String>>((String value) {
            
         return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
          );
          }).toList(), 
          onChanged: (String newValue) {
            setState(() {
            dropdownValue = newValue;
            _controllerPaese.text = newValue;
          });
          },
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

  String dropdownValue = "Italy";
  String messaggioErrore = "";
  bool errore = false;
  bool compila = false;
  
  Future<Utente> _futureUtente;

  Widget _buildRegistrationBtn(BuildContext context) {
    return Column(children: <Widget>[
      Container(
      padding: EdgeInsets.symmetric(vertical: 35.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () { 

          if(!(validateEmail(_controllerEmail.text))){
              messaggioErrore = messaggioErrore + "\nFormato email non valido";
              errore = true;
           }
            
          if(_controllerPassword.text.compareTo(_controllerConferma.text) != 0){
              messaggioErrore = messaggioErrore + "\nLe password devono corrispondere";
              errore = true;
          }
              
          if(!(paesi.contains(_controllerPaese.text))){
              messaggioErrore = messaggioErrore + "\nIl paese deve essere presente nella lista";
              errore = true;
          }

          if(_controllerEmail.text.isEmpty  || _controllerNome.text.isEmpty || _controllerCognome.text.isEmpty || _controllerUsername.text.isEmpty || _controllerPassword.text.isEmpty || _controllerConferma.text.isEmpty || _controllerData.text.isEmpty || _controllerPaese.text.isEmpty) {
            messaggioErrore = messaggioErrore + "\nCompila tutti i campi!";
            errore = true;
            compila = true;
          }
          if(compila){
            messaggioErrore = "Compila tutti i campi";
          }
          
          if(errore){
            Alert(
              context: context,
              //type: AlertType.error,
              title: "Attenzione",
              desc: messaggioErrore,
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
            //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            setState(() {
               _futureUtente = createUtente(_controllerNome.text, _controllerCognome.text, _controllerEmail.text, _controllerPassword.text, _controllerConferma.text, _controllerUsername.text, _controllerData.text, _controllerPaese.text);
            });
           
          }
          errore = false;
          messaggioErrore = "";
          compila = false;
              //----------------------------------------------
              },
                padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        
        color: Colors.white,
        child: Text(
          'Registrati',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    ),  
    ],
    
    );
    
  }


  @override
  Widget build(BuildContext context) {
    return (_futureUtente == null)
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
                    vertical: 30.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/logoBianco.png',
                      width: 220,
                      height: 180,
                      ),
                      Text(
                        'Registrazione',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      _buildNomeTF(),
                       SizedBox(height: 20.0),
                      _buildCognomeTF(),
                      SizedBox(height: 20.0),
                      _buildUsernameTF(),
                      SizedBox(height: 20.0),
                      _buildEmailTF(),
                      SizedBox(height: 20.0),
                      _buildPasswordTF(),
                      SizedBox(height: 20.0),
                      _buildConfirmPasswordTF(),
                      SizedBox(height: 20.0),
                      _buildData(context),
                       SizedBox(height: 20.0),
                      _buildPaeseTF(context),
                     // SizedBox(height: 20.0),
                      //_buildDropDown(context),
                      _buildRegistrationBtn(context),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    )
    :FutureBuilder<Utente>(
                      future: _futureUtente,
                      builder: (context, snapshot1) {
                      if (snapshot1.hasData) { 
                        if(snapshot1.data.risposta=="success"){
                          return AlertDialog(
                           title: Text("Successo",
                           style: kLabelStyle2,
                              textAlign: TextAlign.center,),
                           contentTextStyle: kLabelStyle,
                           shape: RoundedRectangleBorder(borderRadius: 
                            BorderRadius.all(Radius.circular(15))),
                           actions: <Widget>[
                             Text(
                              "\nControlla la tua casella di posta",
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
                              snapshot1.data.risposta,
                              style: kLabelStyle3,
                              textAlign: TextAlign.center,
                             ),
                             FlatButton(child: Text("OK"), onPressed: () {
                               //Navigator.of(context, rootNavigator: true).pop();
                               Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
                             },),
                           ],
                         );
                        }
                       

                    } else if (snapshot1.hasError) {
                      return Text("${snapshot1.error}");
                    }
                    
                    return CircularProgressIndicator();
                  },
                );
  }
  //List<String> paese = [];
  List <String> paesi = ["Australia",
                    "Canada",
                    "USA",
                    "Afghanistan",
                    "Albania",
                    "Algeria",
                    "American Samoa",
                    "Andorra",
                    "Angola",
                    "Anguilla",
                    "Antarctica",
                    "Antigua and Barbuda",
                    "Argentina",
                    "Armenia",
                    "Aruba",
                    "Australia",
                    "Austria",
                    "Azerbaijan",
                    "Bahamas",
                    "Bahrain",
                    "Bangladesh",
                    "Barbados",
                    "Belarus",
                    "Belgium",
                    "Belize",
                    "Benin",
                    "Bermuda",
                    "Bhutan",
                    "Bolivia",
                    "Bosnia and Herzegovina",
                    "Botswana",
                    "Bouvet Island",
                    "Brazil",
                    "British Indian Ocean Territory",
                    "Brunei Darussalam",
                    "Bulgaria",
                    "Burkina Faso",
                    "Burundi",
                    "Cambodia",
                    "Cameroon",
                    "Canada",
                    "Cape Verde",
                    "Cayman Islands",
                    "Central African Republic",
                    "Chad",
                    "Chile",
                    "China",
                    "Christmas Island",
                    "Cocos Islands",
                    "Colombia",
                    "Comoros",
                    "Congo",
                    "Congo"
                    "Cook Islands",
                    "Costa Rica",
                    "Cote d'Ivoire",
                    "Croatia",
                    "Cuba",
                    "Cyprus",
                    "Czech Republic",
                    "Denmark",
                    "Djibouti",
                    "Dominica",
                    "Dominican Republic",
                    "Ecuador",
                    "Egypt",
                    "El Salvador",
                    "Equatorial Guinea",
                    "Eritrea",
                    "Estonia",
                    "Ethiopia",
                    "Falkland Islands",
                    "Faroe Islands",
                    "Fiji",
                    "Finland",
                    "France",
                    "French Guiana",
                    "French Polynesia",
                    "Gabon",
                    "Gambia",
                    "Georgia",
                    "Germany",
                    "Ghana",
                    "Gibraltar",
                    "Greece",
                    "Greenland",
                    "Grenada",
                    "Guadeloupe",
                    "Guam",
                    "Guatemala",
                    "Guinea",
                    "Guinea-Bissau",
                    "Guyana",
                    "Haiti",
                    //"Heard Island and McDonald Islands",
                    "Honduras",
                    "Hong Kong",
                    "Hungary",
                    "Iceland",
                    "India",
                    "Indonesia",
                    "Iran",
                    "Iraq",
                    "Ireland",
                    "Isle of Man",
                    "Israel",
                    "Italy",
                    "Jamaica",
                    "Japan",
                    "Jordan",
                    "Kazakhstan",
                    "Kenya",
                    "Kiribati",
                    "Kuwait",
                    "Kyrgyzstan",
                    "Laos",
                    "Latvia",
                    "Lebanon",
                    "Lesotho",
                    "Liberia",
                    "Libya",
                    "Liechtenstein",
                    "Lithuania",
                    "Luxembourg",
                    "Macao",
                    "Madagascar",
                    "Malawi",
                    "Malaysia",
                    "Maldives",
                    "Mali",
                    "Malta",
                    "Marshall Islands",
                    "Martinique",
                    "Mauritania",
                    "Mauritius",
                    "Mayotte",
                    "Mexico",
                    "Micronesia",
                    "Moldova",
                    "Monaco",
                    "Mongolia",
                    "Montenegro",
                    "Montserrat",
                    "Morocco",
                    "Mozambique",
                    "Myanmar",
                    "Namibia",
                    "Nauru",
                    "Nepal",
                    "Netherlands",
                    "Netherlands Antilles",
                    "New Caledonia",
                    "New Zealand",
                    "Nicaragua",
                    "Niger",
                    "Nigeria",
                    "Norfolk Island",
                    "North Korea",
                    "Norway",
                    "Oman",
                    "Pakistan",
                    "Palau",
                    "Palestinian Territory",
                    "Panama",
                    "Papua New Guinea",
                    "Paraguay",
                    "Peru",
                    "Philippines",
                    "Pitcairn",
                    "Poland",
                    "Portugal",
                    "Puerto Rico",
                    "Qatar",
                    "Romania",
                    "Russian Federation",
                    "Rwanda",
                    "Saint Helena",
                    "Saint Kitts and Nevis",
                    "Saint Lucia",
                    "Saint Pierre and Miquelon",
                    //"Saint Vincent and the Grenadines",
                    "Samoa",
                    "San Marino",
                    "Sao Tome and Principe",
                    "Saudi Arabia",
                    "Senegal",
                    "Serbia",
                    "Seychelles",
                    "Sierra Leone",
                    "Singapore",
                    "Slovakia",
                    "Slovenia",
                    "Solomon Islands",
                    "Somalia",
                    "South Africa",
                    "South Georgia",
                    "South Korea",
                    "Spain",
                    "Sri Lanka",
                    "Sudan",
                    "Suriname",
                    "Svalbard and Jan Mayen",
                    "Swaziland",
                    "Sweden",
                    "Switzerland",
                    "Syrian Arab Republic",
                    "Taiwan",
                    "Tajikistan",
                    "Tanzania",
                    "Thailand",
                    //"The Former Yugoslav Republic of Macedonia",
                    "Timor-Leste",
                    "Togo",
                    "Tokelau",
                    "Tonga",
                    "Trinidad and Tobago",
                    "Tunisia",
                    "Turkey",
                    "Turkmenistan",
                    "Tuvalu",
                    "Uganda",
                    "Ukraine",
                    "United Arab Emirates",
                    "United Kingdom",
                    "United States",
                    //"United States Minor Outlying Islands",
                    "Uruguay",
                    "Uzbekistan",
                    "Vanuatu",
                    "Vatican City",
                    "Venezuela",
                    "Vietnam",
                    "Virgin Islands British",
                    "Virgin Islands U.S.",
                    "Wallis and Futuna",
                    "Western Sahara",
                    "Yemen",
                    "Zambia",
                    "Zimbabwe",];
}