//app_main_page.dart file

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppOpeningCounter extends StatefulWidget {
  const AppOpeningCounter({super.key});

  @override
  State<AppOpeningCounter> createState() => _AppOpeningCounterState();
}

class _AppOpeningCounterState extends State<AppOpeningCounter> {
  
  int appOpeningCounter = 0;

  Future<void> openingControl() async {
    
    var prefs = await SharedPreferences.getInstance();

    appOpeningCounter = prefs.getInt("opening_counter") ?? 0;

    setState(() {
      appOpeningCounter += 1;
    });

    prefs.setInt("opening_counter", appOpeningCounter);
  }

  @override
  void initState() {
    super.initState();
    openingControl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("How Many Times?")),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You've opened the app $appOpeningCounter times",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
          ],
        )));
  }
}
