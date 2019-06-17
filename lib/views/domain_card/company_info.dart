import 'package:dbuilder_mobile/api/api_client.dart';
import 'package:dbuilder_mobile/localization/texts.dart';
import 'package:dbuilder_mobile/models/domain/company.dart';
import 'package:dbuilder_mobile/views/title_text.dart';
import 'package:flutter/material.dart';

import '../action_button.dart';
import '../data_text.dart';

class CompanyInfo extends StatefulWidget {
  final State state;

  const CompanyInfo(this.state);

  @override
  State<StatefulWidget> createState() => _CompanyInfo();
}

class _CompanyInfo extends State<CompanyInfo> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Company>(
      future: ApiClient().getCompany(),
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
                        child: Icon(Icons.work),
                      ),
                      TitleText(Texts().company),
                    ],
                  ),
                  DataText(Texts().id, data.id.toString()),
                  DataText(Texts().title, data.name.toString()),
                  ActionButton(
                    caption: Texts().delete,
                    onTap: () async {
                      await ApiClient().deleteCompany();
                      widget.state.setState(() {});
                    },
                  ),
                ],
              ),
            ),
          );
        }
        return Card(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ActionButton(
                caption: Texts().createCompany,
                onTap: () async {
                  await ApiClient().createCompany();
                  widget.state.setState(() {});
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
