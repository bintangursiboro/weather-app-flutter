import 'package:kiwi/kiwi.dart';
import 'package:tugas/data/db.dart';
import 'package:tugas/data/network.dart';
import 'package:tugas/permission/permission_handler.dart';

class KiwiInject {
  void initInjection() {
    final Container container = Container();
    container.registerInstance(NetworkCall());
    container.registerInstance(DBProvider());
    container.registerInstance(AppPermission());
  }

  NetworkCall getNetworkCall() {
    final Container container = Container();
    // container.registerInstance(NetworkCall());
    return container.resolve<NetworkCall>();
  }

  DBProvider getDBProvider() {
    final Container container = Container();
    return container.resolve<DBProvider>();
  }

  AppPermission getAppPermission() {
    final Container container = Container();
    return container.resolve<AppPermission>();
  }
}
