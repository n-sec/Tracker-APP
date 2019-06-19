import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State {
  final _formKey = GlobalKey<FormState>();
  final _userTextEditingController = TextEditingController();
  final _passTextEditingController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _userTextEditingController.dispose();
    _passTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: FlutterLogo(
                          size: 80,
                        ),
                      ),
                      TextFormField(
                        controller: _userTextEditingController,
                        autofocus: true,
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: 'Digite seu ID',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'O campo ID está vazio.';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: TextFormField(
                          controller: _passTextEditingController,
                          obscureText: true,
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            hintText: 'Digite sua senha',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'O campo senha está vazio.';
                            }
                            return null;
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          child: Container(
                            padding: EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                            ),
                            child: Text('Esqueceu sua senha?'),
                          ),
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 5,
                        ),
                        child: ButtonTheme(
                          minWidth: 110,
                          textTheme: ButtonTextTheme.primary,
                          child: RaisedButton(
                            child: Text('Entrar'),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Credenciais inválidas...'),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      ButtonTheme(
                        textTheme: ButtonTextTheme.primary,
                        child: FlatButton(
                          child: Text('Cadastrar'),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}