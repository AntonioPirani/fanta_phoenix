import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      width: double.infinity,
      child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
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
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                  return Colors.white;
                }),
                padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.all(15.0),
                ),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                elevation: WidgetStateProperty.all<double>(5.0),
                minimumSize: WidgetStateProperty.all<Size>(const Size(150, 50)),
              ),
              child: 
                const Text(
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