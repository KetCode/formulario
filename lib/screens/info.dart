import 'package:formulario/screens/politicspriv.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Info extends StatelessWidget {
  const Info({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Formulário',style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,)),
            SizedBox(height: 10,),
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset(
                  "assets/images/iconLogo.png"), 
            ),
            SizedBox(height: 10,),
            Text('criado por ketcode',style: TextStyle(fontSize: 14.0,)),
            Text('v1.0',style: TextStyle(fontSize: 14.0,)),
            SizedBox(height: 10,),
            FlatButton(onPressed: (){Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PolPriv()));}, child: Text('Teste',style: TextStyle(fontSize: 14.0,)),),
            SizedBox(height: 10,),
            Text('Para mais informações',style: TextStyle(fontSize: 12.0,)),
            Text('entre em contato:',style: TextStyle(fontSize: 12.0,)),
            FlatButton(onPressed: () {_launchEmail('email@email.com');}, child: Text('email@email.com',style: TextStyle(fontSize: 12.0,)),),
          ]),
    ));
  }
}

void _launchEmail(String emailID) async{
  var url = "mailto:$emailID";
  if(await canLaunch(url)){
    await launch(url);
  } else {
    throw 'Não foi possível enviar o email.';
  }
}
