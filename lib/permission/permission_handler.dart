import 'package:permission/permission.dart';

class AppPermission {
  AppPermission();
  var locationPermissions =
      Permission.requestPermissions([PermissionName.Location]);
  var locationStatus =
      Permission.getPermissionsStatus([PermissionName.Location]);
}
