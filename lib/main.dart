import 'package:formulario/screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("pt", "BR")
      ],
      debugShowCheckedModeBanner: false,
      home: LoginScreen(), // Pagina que vai abrir ao iniciar o app.
    );
  }
}



