import 'package:flutter/material.dart';
import 'package:smart_home/data/local/storage_repository.dart';
import 'package:smart_home/services/app_permissions.dart';
import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.init();
  await AppPermissions.getLocationPermission();
  runApp(
    const App(),
  );
}
