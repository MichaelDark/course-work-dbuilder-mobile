import 'package:dbuilder_mobile/api/api_client.dart';
import 'package:dbuilder_mobile/localization/texts.dart';
import 'package:dbuilder_mobile/models/domain/number_criteria.dart';
import 'package:flutter/material.dart';

import 'action_button.dart';

class NumberCriterionDD extends StatefulWidget {
  final int buildingTaskId;
  final VoidCallback onAdded;

  const NumberCriterionDD(this.onAdded, this.buildingTaskId);

  @override
  _NumberCriterionDDState createState() => _NumberCriterionDDState();
}

class _NumberCriterionDDState extends State<NumberCriterionDD> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: FutureBuilder<List<NumberCriteria>>(
        future: ApiClient().getNumberCriterion(),
        builder: (context, snap) {
          if (snap.hasData) {
            final data = snap.data;

            return _NewValueWidget(widget.onAdded, widget.buildingTaskId, data);
          }
          return Container();
        },
      ),
    );
  }
}

class _NewValueWidget extends StatefulWidget {
  final int buildingTaskId;
  final List<NumberCriteria> criterion;
  final VoidCallback onAdded;

  const _NewValueWidget(
    this.onAdded,
    this.buildingTaskId,
    this.criterion,
  );

  @override
  _NewValueWidgetState createState() => _NewValueWidgetState();
}

class _NewValueWidgetState extends State<_NewValueWidget> {
  TextEditingController controller = TextEditingController();
  NumberCriteria selectedCriteria;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 8,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            child: Text(
              Texts().chooseCriteria,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 16,
                ),
                child: DropdownButton(
                  value: selectedCriteria,
                  items: widget.criterion.map<DropdownMenuItem>(
                    (NumberCriteria criteria) {
                      return DropdownMenuItem(
                        child: Container(
                          child: Text(
                            '${criteria.name} (${criteria.minValue} - ${criteria.maxValue})',
                          ),
                        ),
                        value: criteria,
                      );
                    },
                  ).toList(),
                  onChanged: (newCriteria) {
                    setState(() {
                      selectedCriteria = newCriteria;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        if (selectedCriteria != null)
          Column(
            children: [
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 8,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  child: Text(
                    Texts().enterValue,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 16,
                      ),
                      child: TextField(
                        controller: controller,
                        onChanged: (newValue) {
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        if (double.tryParse(controller.text) != null)
          Column(
            children: [
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 16,
                      ),
                      child: ActionButton(
                        caption: Texts().create,
                        onTap: () async {
                          await ApiClient().createNumberValue(
                            widget.buildingTaskId,
                            selectedCriteria.id,
                            double.tryParse(controller.text),
                          );
                          widget.onAdded();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
      ],
    );
  }
}
