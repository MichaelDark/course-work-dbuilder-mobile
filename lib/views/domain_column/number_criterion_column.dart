import 'package:dbuilder_mobile/api/api_client.dart';
import 'package:dbuilder_mobile/localization/texts.dart';
import 'package:dbuilder_mobile/models/domain/number_criteria.dart';
import 'package:dbuilder_mobile/views/domain_card/number_criteria_info.dart';
import 'package:flutter/material.dart';

class NumberCriterionColumn extends StatefulWidget {
  final VoidCallback setState;

  const NumberCriterionColumn(this.setState);

  @override
  State<StatefulWidget> createState() => _NumberCriterionColumnState();
}

class _NumberCriterionColumnState extends State<NumberCriterionColumn> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NumberCriteria>>(
      future: ApiClient().getNumberCriterion(),
      builder: (context, snap) {
        if (snap.hasData) {
          final data = snap.data;

          data.sort(
              (NumberCriteria b1, NumberCriteria b2) => b2.id.compareTo(b1.id));

          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: data
                .map<Widget>(
                  (NumberCriteria criteria) =>
                      NumberCriteriaInfo(this, criteria),
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
                              child: Text(Texts().createNumberCriteria),
                              onPressed: () async {
                                await ApiClient().createNumberCriteria();
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
