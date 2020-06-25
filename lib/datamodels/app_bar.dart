import 'package:flutter/material.dart';

AppBar homeAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFFFEB00), // Colors.white
      elevation: 0,
      title:  Padding(
        padding: const EdgeInsets.only(left: 38.0),
        child: Text('Formulário', style: TextStyle(color: Colors.grey.shade800),),
      ),
      iconTheme: IconThemeData(color: Colors.grey.shade800),
    );
  }