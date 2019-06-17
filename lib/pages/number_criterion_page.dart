import 'package:dbuilder_mobile/localization/texts.dart';
import 'package:dbuilder_mobile/views/domain_column/number_criterion_column.dart';
import 'package:dbuilder_mobile/views/top_bar.dart';
import 'package:flutter/material.dart';

class NumberCriterionPage extends StatefulWidget {
  const NumberCriterionPage();

  @override
  State<StatefulWidget> createState() => _NumberCriterionPageState();
}

class _NumberCriterionPageState extends State<NumberCriterionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(this, Texts().numberCriterion),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 600,
            child: NumberCriterionColumn(() => setState(() {})),
          ),
        ),
      ),
    );
  }
}
