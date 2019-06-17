import 'package:dbuilder_mobile/localization/texts.dart';
import 'package:dbuilder_mobile/models/domain/building.dart';
import 'package:dbuilder_mobile/views/domain_card/building_info.dart';
import 'package:dbuilder_mobile/views/domain_column/building_tasks_column.dart';
import 'package:dbuilder_mobile/views/top_bar.dart';
import 'package:flutter/material.dart';

class BuildingPage extends StatefulWidget {
  final Building building;

  const BuildingPage(this.building);

  @override
  State<StatefulWidget> createState() => _BuildingPageState();
}

class _BuildingPageState extends State<BuildingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(this, Texts().building),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 600,
            child: Column(
              children: [
                BuildingInfo(
                  this,
                  widget.building,
                  showActions: false,
                  showTaskCount: false,
                ),
                BuildingTasksColumn(() => setState(() {}), widget.building.id),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
