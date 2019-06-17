import 'package:dbuilder_mobile/localization/texts.dart';
import 'package:dbuilder_mobile/views/domain_card/company_info.dart';
import 'package:dbuilder_mobile/views/domain_column/buildings_column.dart';
import 'package:dbuilder_mobile/views/top_bar.dart';
import 'package:dbuilder_mobile/views/user_info.dart';
import 'package:flutter/material.dart';

class BuildingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BuildingsPageState();
}

class _BuildingsPageState extends State<BuildingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        this,
        Texts().company,
        leading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 600,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CompanyInfo(this),
                    UserInfo(),
                  ],
                ),
                BuildingsColumn(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
