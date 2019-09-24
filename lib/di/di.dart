import 'package:kiwi/kiwi.dart';
import 'package:tugas/data/db.dart';
import 'package:tugas/data/network.dart';

class KiwiInject {
  void initInjection() {
    final Container container = Container();
    container.registerInstance(NetworkCall());
    container.registerInstance(DBProvider());
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
}
