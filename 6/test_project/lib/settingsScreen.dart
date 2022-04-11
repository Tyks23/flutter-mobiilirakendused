import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/theme_model.dart';

class Settings extends StatefulWidget {
  @override
  _Settings createState() => _Settings();
}

class _Settings extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(themeNotifier.isDark ? "Dark Mode" : "Light Mode"),
        ),
        floatingActionButton: Wrap(
          //will break to another line on overflow
          direction: Axis.horizontal,
          //use vertical to show  on vertical axis
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 20),
                child: FloatingActionButton(
                  heroTag: "theme",
                  onPressed: () {
                    themeNotifier.isDark
                        ? themeNotifier.isDark = false
                        : themeNotifier.isDark = true;
                  },
                  child: Icon(themeNotifier.isDark
                      ? Icons.nightlight_round
                      : Icons.wb_sunny),
                )),
            Container(
                margin: EdgeInsets.only(left:10,top: 20),
                child: FloatingActionButton(
                  heroTag: "theme",
                  onPressed: () {
                    themeNotifier.count++;

                  },
                  child: Text(
                    themeNotifier.count.toString()
                  ),
                )),// button second // button third

            // Add more buttons here
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    });
  }
}
