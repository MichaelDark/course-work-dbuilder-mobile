import 'package:dbuilder_mobile/api/api_client.dart';
import 'package:dbuilder_mobile/localization/texts.dart';
import 'package:dbuilder_mobile/pages/splash_page.dart';
import 'package:flutter/material.dart';

class TopBar extends AppBar {
  TopBar(
    State state,
    String title, {
    bool leading = true,
    bool showLocaleChange = true,
  }) : super(
            centerTitle: true,
            title: Text(title),
            leading: Builder(builder: (context) {
              return leading
                  ? GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'Back',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container();
            }),
            actions: [
              if (showLocaleChange)
                Builder(
                  builder: (context) {
                    return FlatButton(
                      child: Text(
                        Texts().nextLocale,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Texts().changeLocale();
                        state.setState(() {});
                      },
                    );
                  },
                ),
              if (ApiClient().token != null)
                Builder(builder: (context) {
                  return FlatButton(
                    child: Text(
                      Texts().logout,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      ApiClient().token = null;
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => SplashPage()),
                          (_) => false);
                    },
                  );
                }),
            ]);
}
