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
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                    )
                  : Container();
            }),
            actions: [
              if (showLocaleChange)
                Builder(
                  builder: (context) {
                    return IconButton(
                      icon: Icon(Icons.language),
                      onPressed: () {
                        Texts().changeLocale();
                        state.setState(() {});
                      },
                    );
                  },
                ),
              if (ApiClient().token != null)
                Builder(builder: (context) {
                  return IconButton(
                    icon: Icon(Icons.exit_to_app),
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
