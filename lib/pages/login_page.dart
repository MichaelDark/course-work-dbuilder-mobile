import 'package:dbuilder_mobile/api/api_client.dart';
import 'package:dbuilder_mobile/localization/texts.dart';
import 'package:dbuilder_mobile/models/requests/login_request.dart';
import 'package:dbuilder_mobile/models/response/login_response.dart';
import 'package:dbuilder_mobile/views/states/networking_state.dart';
import 'package:dbuilder_mobile/views/top_bar.dart';
import 'package:flutter/material.dart';

import 'buildings_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends NetworkingState
    with SenderMixin<LoginRequest, LoginResponse> {
  TextEditingController _loginText = TextEditingController(text: 'john_doe');
  TextEditingController _passwordText = TextEditingController(text: 'password');

  @override
  Future<void> createDataSender(LoginRequest data) => ApiClient().login(data);

  @override
  Future<void> onDataSent(_, LoginResponse response) async {
    print('${response.token}');
    await Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => BuildingsPage()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(this, Texts().login),
      body: Center(
        child: SizedBox(
          width: 560,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _loginText,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _passwordText,
                  obscureText: true,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Builder(
                  builder: (context) {
                    return RaisedButton(
                      child: Text(Texts().login),
                      onPressed: () {
                        sendData(
                          LoginRequest(
                            username: _loginText.text,
                            password: _passwordText.text,
                          ),
                        );
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
