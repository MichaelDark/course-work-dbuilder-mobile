import 'package:dbuilder_mobile/api/api_client.dart';
import 'package:dbuilder_mobile/localization/texts.dart';
import 'package:dbuilder_mobile/models/requests/register_request.dart';
import 'package:dbuilder_mobile/views/top_bar.dart';
import 'package:flutter/material.dart';

import 'buildings_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(this, Texts().register),
      body: Center(
        child: SizedBox(
          width: 560,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: Texts().name,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: surnameController,
                  decoration: InputDecoration(
                    hintText: Texts().surname,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: Texts().userName,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Builder(
                  builder: (context) {
                    return RaisedButton(
                      child: Text(Texts().register),
                      onPressed: () async {
                        String name = nameController.text;
                        String surname = surnameController.text;
                        String username = usernameController.text;
                        String password = passwordController.text;

                        if (name.isEmpty ||
                            surname.isEmpty ||
                            username.isEmpty ||
                            password.isEmpty ||
                            password.length < 8) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                Texts().registrationError,
                              ),
                            ),
                          );
                        } else {
                          try {
                            await ApiClient().register(
                              RegisterRequest(
                                name: name,
                                surname: surname,
                                username: username,
                                password: password,
                                isCompanyOwner: true,
                              ),
                            );

                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (_) => BuildingsPage()),
                              (_) => false,
                            );
                          } catch (_) {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  Texts().registrationError,
                                ),
                              ),
                            );
                          }
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
