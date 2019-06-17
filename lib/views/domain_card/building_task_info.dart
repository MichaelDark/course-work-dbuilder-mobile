import 'package:dbuilder_mobile/api/api_client.dart';
import 'package:dbuilder_mobile/localization/texts.dart';
import 'package:dbuilder_mobile/models/domain/building_task.dart';
import 'package:dbuilder_mobile/views/domain_column/building_task_criterion_column.dart';
import 'package:dbuilder_mobile/views/title_text.dart';
import 'package:flutter/material.dart';

import '../action_button.dart';
import '../data_text.dart';

class BuildingTaskInfo extends StatefulWidget {
  final State state;
  final int buildingId;
  final BuildingTask task;
  final bool showActions;

  const BuildingTaskInfo(this.state, this.buildingId, this.task,
      {this.showActions = true});

  @override
  _BuildingTaskInfoState createState() => _BuildingTaskInfoState();
}

class _BuildingTaskInfoState extends State<BuildingTaskInfo> {
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
                  child: Icon(Icons.assignment),
                ),
                TitleText(Texts().buildingTask),
              ],
            ),
            DataText(Texts().id, widget.task.id.toString()),
            DataText(Texts().title, widget.task.name.toString()),
            DataText(Texts().dueDate, widget.task.dueDate.toString()),
            DataText(Texts().createdAt, widget.task.createdAt.toString()),
            if (widget.showActions)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ActionButton(
                    caption: Texts().delete,
                    onTap: () async {
                      await ApiClient().deleteBuildingTask(widget.task.id);
                      widget.state.setState(() {});
                    },
                  ),
                ],
              ),
            BuildingTaskCriterionColumn(
              () => widget.state.setState(() {}),
              widget.task,
            ),
          ],
        ),
      ),
    );
  }
}
