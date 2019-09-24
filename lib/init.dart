import 'package:flutter/material.dart';
import 'package:tugas/di/di.dart';
import 'package:tugas/page/weather.dart';

class Init extends StatelessWidget {
  final Widget appBuilder;

  Init({@required this.appBuilder});

  Future init() async {
    final KiwiInject injector = KiwiInject();
    injector.initInjection();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return appBuilder;
        } else {
          return Container();
        }
      },
    );
  }
}
