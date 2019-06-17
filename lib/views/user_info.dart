import 'package:dbuilder_mobile/api/api_client.dart';
import 'package:dbuilder_mobile/localization/texts.dart';
import 'package:dbuilder_mobile/models/domain/user_entity.dart';
import 'package:dbuilder_mobile/views/title_text.dart';
import 'package:flutter/material.dart';

import 'data_text.dart';

class UserInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserInfo();
}

class _UserInfo extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserEntity>(
      future: ApiClient().getUserInfo(),
      builder: (context, snap) {
        if (snap.hasData) {
          final data = snap.data;

          return Card(
            margin: EdgeInsets.all(16),
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.face),
                      ),
                      TitleText(Texts().userInfo),
                    ],
                  ),
                  DataText(Texts().id, data.id.toString()),
                  DataText(Texts().userName, data.username.toString()),
                  DataText(Texts().name, data.name.toString()),
                  DataText(Texts().surname, data.surname.toString()),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
