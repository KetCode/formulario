import 'package:formulario/screens/sheets/sheet_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;

  var _formkey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Form(
                key: _formkey,
                child: ListView(children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.95,
                      decoration: BoxDecoration(
                          color: Color(0xFFFFEB00),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(100))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 160,
                              height: 160,
                              child: Image.asset(
                                  "assets/images/iconLogo.png"),
                            ),
                          ])),
                  Container(
                      padding: EdgeInsets.only(top: 24, left: 40, right: 40),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            // autofocus: true,
                            keyboardType: TextInputType
                                .emailAddress, 
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Campo está em branco";
                              }
                              if (!RegExp(
                                      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                  .hasMatch(value)) {
                                return "Insira um endereço de e-mail válido";
                              }
                              return null;
                            },
                            onChanged: (item) {
                              setState(() {
                                _email = item;
                              });
                            },
                            decoration: InputDecoration(
                              // hintText: "Enter Email",
                              labelText: "E-mail",
                              labelStyle: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            // autofocus: true,
                            obscureText: true, 
                            keyboardType: TextInputType
                                .text, 
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Campo está em branco";
                              }
                              return null;
                            },
                            onChanged: (item) {
                              setState(() {
                                _password = item;
                              });
                            },
                            decoration: InputDecoration(
                              // hintText: "Enter Password",
                              labelText: "Senha",
                              labelStyle: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 25, // ou 40
                          ),
                          Container(
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.3, 1],
                                colors: [
                                  Color(0xFFF5E000),
                                  Color(
                                      0xFFF5E000), 
                                ],
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: SizedBox.expand(
                              child: FlatButton(
                                onPressed: () {
                                  login();
                                },
                                child:Text(
                                  "Entrar",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade800,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ]),
              ),
            ),
    );
  }

  void login() {
    if (_formkey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password)
          .then((user) {
        // sign in
        setState(() {
          isLoading = false;
        });

        Fluttertoast.showToast(msg: "Logado com sucesso");

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => SheetScreen()),
            (Route<dynamic> route) => false);
      }).catchError((onError) {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: "Conta não encontrada");
      });
    }
  }
}
