import 'package:dbuilder_mobile/api/api_client.dart';
import 'package:dbuilder_mobile/localization/texts.dart';
import 'package:dbuilder_mobile/models/domain/building_task.dart';
import 'package:dbuilder_mobile/models/domain/number_value.dart';
import 'package:dbuilder_mobile/pages/new_value_page.dart';
import 'package:flutter/material.dart';

class BuildingTaskCriterionColumn extends StatefulWidget {
  final BuildingTask task;
  final VoidCallback setState;

  const BuildingTaskCriterionColumn(this.setState, this.task);

  @override
  State<StatefulWidget> createState() => _BuildingTaskCriterionColumnState();
}

class _BuildingTaskCriterionColumnState
    extends State<BuildingTaskCriterionColumn> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NumberValue>>(
      future: ApiClient().getNumberValues(widget.task.id),
      builder: (context, snap) {
        if (snap.hasData) {
          final data = snap.data;

          data.sort((NumberValue b1, NumberValue b2) => b2.id.compareTo(b1.id));

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: data.map<Widget>(
              (NumberValue value) {
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        color: value.isValid
                            ? Colors.lightGreen
                            : Colors.red.shade100,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        '${value.numberCriteria.name}',
                                      ),
                                      Text(
                                        '${value.value}',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  child: Icon(Icons.delete),
                                ),
                                onTap: () async {
                                  await ApiClient()
                                      .deleteNumberValueById(value.id);
                                  widget.setState();
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ).toList()
              ..insert(
                0,
                Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: RaisedButton(
                          child: Text(Texts().addNumberValue),
                          onPressed: () async {
                            await ApiClient()
                                .createNumberValue(widget.task.id, 1);
                            widget.setState();
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: RaisedButton(
                          child: Text(Texts().addNumberValueManually),
                          onPressed: () async {
                            await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => NewValuePage(widget.task),
                              ),
                            );
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
