import 'package:dbuilder_mobile/api/api_client.dart';
import 'package:dbuilder_mobile/localization/texts.dart';
import 'package:dbuilder_mobile/models/domain/building.dart';
import 'package:dbuilder_mobile/pages/number_criterion_page.dart';
import 'package:dbuilder_mobile/views/domain_card/building_info.dart';
import 'package:flutter/material.dart';

class BuildingsColumn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BuildingsColumnState();
}

class _BuildingsColumnState extends State<BuildingsColumn> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Building>>(
      future: ApiClient().getBuildings(),
      builder: (context, snap) {
        if (snap.hasData) {
          final data = snap.data;

          data.sort((Building b1, Building b2) => b2.id.compareTo(b1.id));

          return Column(
            children: data
                .map<Widget>(
                  (Building building) => BuildingInfo(this, building),
                )
                .toList()
                  ..insert(
                    0,
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                child: RaisedButton(
                                  child: Text(
                                    Texts().numberCriterion,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                NumberCriterionPage()));
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: RaisedButton(
                                  child: Text(Texts().createBuilding),
                                  onPressed: () async {
                                    await ApiClient().createBuilding();
                                    setState(() {});
                                  },
                                ),
                              ),
                            ],
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
