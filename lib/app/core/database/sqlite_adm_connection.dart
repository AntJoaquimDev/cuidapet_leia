import 'package:cuidapet_leia/app/core/database/sqlite_connection_factory.dart';
import 'package:flutter/material.dart';

class SqliteAdmConnection with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    var connection = SqliteConnectionFactory();
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
      case AppLifecycleState.detached:
        connection.closeConnection();
        break;
    }

    super.didChangeAppLifecycleState(state);
  }
}
