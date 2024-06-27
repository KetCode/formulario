// import 'package:formulario/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:formulario/screens/sheets/sheet_screen.dart';

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
      home: SheetScreen(), // Pagina que vai abrir ao iniciar o app.
    );
  }
}



