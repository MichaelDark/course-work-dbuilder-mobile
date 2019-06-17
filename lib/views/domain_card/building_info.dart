import 'package:dbuilder_mobile/api/api_client.dart';
import 'package:dbuilder_mobile/localization/texts.dart';
import 'package:dbuilder_mobile/models/domain/building.dart';
import 'package:dbuilder_mobile/pages/building_page.dart';
import 'package:dbuilder_mobile/views/title_text.dart';
import 'package:flutter/material.dart';

import '../action_button.dart';
import '../data_text.dart';

class BuildingInfo extends StatelessWidget {
  final State state;
  final Building building;
  final bool showTaskCount;
  final bool showActions;

  const BuildingInfo(this.state, this.building,
      {this.showActions = true, this.showTaskCount = true});

  @override
  Widget build(BuildContext context) {
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
                  child: Icon(Icons.home),
                ),
                TitleText(Texts().building),
              ],
            ),
            DataText(Texts().id, building.id.toString()),
            DataText(Texts().title, building.name.toString()),
            DataText(Texts().description, building.description.toString()),
            if (showTaskCount)
              DataText(
                  Texts().taskCount, building.buildingTasksCount.toString()),
            DataText(Texts().createdAt, building.createdAt.toString()),
            if (showActions)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ActionButton(
                    caption: Texts().delete,
                    onTap: () async {
                      await ApiClient().deleteBuilding(building.id);
                      state.setState(() {});
                    },
                  ),
                  ActionButton(
                    caption: Texts().details,
                    onTap: () async {
                      await Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => BuildingPage(building)));
                      state.setState(() {});
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
