import 'package:flutter/material.dart';
import 'package:todolist/screens/recycle_bin.dart';
import 'package:todolist/screens/summary.dart';
import 'package:todolist/screens/tabs_screen.dart';

class Approuter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => const RecycleBin());
      case SummaryScreen.id:
        return MaterialPageRoute(builder: (_) => const SummaryScreen());
      case TabsScreen.id:
        return MaterialPageRoute(builder: (_) => const TabsScreen());
      default:
        return null;
    }
  }
}
