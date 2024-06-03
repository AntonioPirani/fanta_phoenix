import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fanta_phoenix/src/features/autenticazione/login_screen.dart';

void main() {

  // Serve perchè sennò non si può mettere il layout solo verticale
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp]
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: MaterialApp(
        title: 'FantaPhoenix',
      // debugShowCheckedModeBanner: false,
        home: LoginScreen()
      // home: Scaffold(
      //   body: Center(
      //     child: Text('Hello World!'),
      //   ),
      // )
      ),

    );
  }
}

// TODO Da spostare questo file dentro /src (ci ho provato ma dopo non compila)
// ? valutare se usare file .ico per le icone o lasciare .png