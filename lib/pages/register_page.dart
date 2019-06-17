import 'package:dbuilder_mobile/localization/texts.dart';
import 'package:dbuilder_mobile/views/top_bar.dart';
import 'package:flutter/material.dart';

import 'buildings_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                child: TextField(),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Builder(
                  builder: (context) {
                    return RaisedButton(
                      child: Text(Texts().register),
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => BuildingsPage()),
                          (_) => false,
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
