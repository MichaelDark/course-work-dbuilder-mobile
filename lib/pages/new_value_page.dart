import 'package:dbuilder_mobile/localization/texts.dart';
import 'package:dbuilder_mobile/models/domain/building_task.dart';
import 'package:dbuilder_mobile/views/number_criterion_dd.dart';
import 'package:dbuilder_mobile/views/top_bar.dart';
import 'package:flutter/material.dart';

class NewValuePage extends StatefulWidget {
  final BuildingTask task;

  const NewValuePage(this.task);

  @override
  State<StatefulWidget> createState() => _NewValuePageState();
}

class _NewValuePageState extends State<NewValuePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        this,
        Texts().enterValue,
        showLocaleChange: false,
      ),
      body: Center(
        child: SizedBox(
          width: 560,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                NumberCriterionDD(
                  () => Navigator.of(context).pop(),
                  widget.task.id,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
