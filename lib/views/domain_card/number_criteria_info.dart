import 'package:dbuilder_mobile/api/api_client.dart';
import 'package:dbuilder_mobile/localization/texts.dart';
import 'package:dbuilder_mobile/models/domain/number_criteria.dart';
import 'package:dbuilder_mobile/views/title_text.dart';
import 'package:flutter/material.dart';

import '../action_button.dart';
import '../data_text.dart';

class NumberCriteriaInfo extends StatelessWidget {
  final State state;
  final NumberCriteria criteria;
  final bool showActions;

  const NumberCriteriaInfo(this.state, this.criteria,
      {this.showActions = true});

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
                  child: Icon(Icons.filter_9_plus),
                ),
                TitleText(Texts().numberCriteria),
              ],
            ),
            DataText(Texts().id, criteria.id.toString()),
            DataText(Texts().title, criteria.name.toString()),
            DataText(Texts().minValue, criteria.minValue.toStringAsFixed(2)),
            DataText(Texts().maxValue, criteria.maxValue.toStringAsFixed(2)),
            DataText(Texts().createdAt, criteria.createdAt.toString()),
            if (showActions)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ActionButton(
                    caption: Texts().delete,
                    onTap: () async {
                      await ApiClient().deleteNumberCriteria(criteria.id);
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
