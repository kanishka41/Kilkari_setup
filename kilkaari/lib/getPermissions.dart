import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  static Future<bool> requestPermissions() async {
    // Request camera and storage permissions
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.storage,
    ].request();

    // Check if permissions are granted
    if (statuses[Permission.camera] == PermissionStatus.granted &&
        statuses[Permission.storage] == PermissionStatus.granted) {
      // Permissions granted
      return true;
    } else {
      // Permissions not granted
      return false;
    }
  }
}
