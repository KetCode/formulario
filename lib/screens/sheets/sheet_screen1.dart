import 'package:formulario/datamodels/app_bar.dart';
import 'package:formulario/datamodels/custom_drawer.dart';
import 'package:formulario/datamodels/feedback_form.dart';
import 'package:formulario/screens/sheets/sheet_screen.dart';
import 'package:formulario/services/controller.dart';
import 'package:flutter/material.dart';

//dataNow:
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class SheetScreen1 extends StatefulWidget {
  SheetScreen1({Key key}) : super(key: key);

  @override
  _SheetScreen1State createState() => _SheetScreen1State();
}

class _SheetScreen1State extends State<SheetScreen1> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // TextField Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController funcController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      FeedbackForm feedbackForm = FeedbackForm(
        nameController.text,
        emailController.text,
        mobileNoController.text,
        funcController.text,
        dateController.text,
      );

      FormController formController = FormController((String response) {
        print("Response: $response");
        if (response == FormController.STATUS_SUCCESS) {
          //
          _showSnackbar(
              "Formulário Enviado"); // Trocar esse showbar para portugues.
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SheetScreen()));
        } else {
          _showSnackbar("Error!");
        }
      });

      _showSnackbar("Enviando Formulário");

      // Submit 'feedbackForm' and save it in Google Sheet

      formController.submitForm(feedbackForm);
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFEB00),
      key: _scaffoldKey,
      appBar: homeAppBar(context),
      drawer: customDrawer(context),
      body: Container(
        padding: EdgeInsets.only(top: 15, left: 30, right: 30),
        // padding:
        //     EdgeInsets.symmetric(vertical: 40, horizontal: 24), //vertical 50
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: nameController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Campo está em branco";
                        } else if (value.length < 3) {
                          return "Insira um nome válido";
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Nome do cliente",
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      // validator: (value) {
                      //   if (value.isEmpty) {
                      //     return "Campo está em branco";
                      //   }
                      //   if (!RegExp(
                      //           r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                      //       .hasMatch(value)) {
                      //     return "Insira um endereço de e-mail válido";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(labelText: "E-mail"),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: mobileNoController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira um número de telefone válido";
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: "Telefone"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: funcController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Campo está em branco";
                        } else if (value.length < 3) {
                          return "Insira um nome válido";
                        }
                      },
                      decoration: InputDecoration(labelText: "Funcionário"),
                    ),
                    Column(children: <Widget>[
                      DateTimeField(
                        format: DateFormat("dd/MM/yyyy"),
                        onShowPicker: (context, currentValue) async {
                          DateTime inputValue;
                          DateTime date = await showDatePicker(
                              context: context,
                              initialDate: currentValue ?? DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2050)),
                              locale: Locale("pt", "BR"),
                              helpText: 'Selecione a data');
                          inputValue = date;
                          return inputValue;
                        },
                        controller: dateController,
                        decoration: InputDecoration(labelText: "Data"),
                      ),
                    ]),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
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
                      Colors.white, //0xFFF58524
                      Colors.white, // Cores do gradiente do botão. /0xFFF92B7F
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Center(
                  child: FlatButton(
                    onPressed: _submitForm,
                    child: Text(
                      'Registrar dados',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
