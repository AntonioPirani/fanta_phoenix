import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
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
                Text(
                  'Login',
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
}