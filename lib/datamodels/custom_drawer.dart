import 'package:formulario/screens/info.dart';
import 'package:formulario/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//URL Planilha
  _launchPlanilha() async {
    const url =
        'https://docs.google.com/spreadsheets/d/11jBoeIpv717utJyfFJYzrvNHvVdMonhmV290RrfgD_w/edit#gid=0';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir a planilha do excel';
    }
  }

Drawer customDrawer(BuildContext context) {
    return Drawer(
      child: Container(
          child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            SizedBox(
              width: 92,
              height: 92,
              child: Image.asset(
                  "assets/images/iconLogo.png"), 
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(
                '     Formulário',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ]),
          CustomListTitle(
              Icons.assignment, 'Planilha do Excel', _launchPlanilha),
          CustomListTitle(Icons.info, 'Informações', () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => Info()));
          }),
          Spacer(),
          CustomListTitle(Icons.exit_to_app, 'Sair', () {
            FirebaseAuth.instance.signOut().then((onValue) {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false); 
            });
          }),
        ],
      )),
    );
  }

class CustomListTitle extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomListTitle(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
          splashColor: Color(0xFFFFEB00),
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(children: <Widget>[
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ]),
                ]),
          ),
        ),
      ),
    );
  }
}