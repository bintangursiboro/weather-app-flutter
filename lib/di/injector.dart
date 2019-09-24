import 'package:kiwi/kiwi.dart';
import 'package:tugas/data/db.dart';
import '../data/network.dart';

class KiwiInjector {
  KiwiInjector();

  void initInjection() {
    final Container container = Container();
    container.registerInstance(NetworkCall());
  }

  NetworkCall getNetworkCall() {
    final Container container = Container();
    return container.resolve<NetworkCall>();
  }

  DBProvider getDBProvider() {
    final Container container = Container();
    return container.resolve<DBProvider>();
  }
}
