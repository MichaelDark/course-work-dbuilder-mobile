import 'package:dbuilder_mobile/api/api_client.dart';
import 'package:dbuilder_mobile/localization/texts.dart';
import 'package:dbuilder_mobile/models/domain/building_task.dart';
import 'package:dbuilder_mobile/views/domain_card/building_task_info.dart';
import 'package:flutter/material.dart';

class BuildingTasksColumn extends StatefulWidget {
  final VoidCallback setState;
  final int buildingId;

  const BuildingTasksColumn(this.setState, this.buildingId);

  @override
  State<StatefulWidget> createState() => _BuildingTasksColumnState();
}

class _BuildingTasksColumnState extends State<BuildingTasksColumn> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BuildingTask>>(
      future: ApiClient().getBuildingTasks(widget.buildingId),
      builder: (context, snap) {
        if (snap.hasData) {
          final data = snap.data;

          data.sort(
              (BuildingTask b1, BuildingTask b2) => b2.id.compareTo(b1.id));

          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: data
                .map<Widget>(
                  (BuildingTask task) =>
                      BuildingTaskInfo(this, widget.buildingId, task),
                )
                .toList()
                  ..insert(
                    0,
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            child: RaisedButton(
                              child: Text(Texts().createTask),
                              onPressed: () async {
                                await ApiClient()
                                    .createBuildingTask(widget.buildingId);
                                widget.setState();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        }
        return Container();
      },
    );
  }
}
