import 'package:flutter/material.dart';
import 'package:smart_home/data/local/storage_repository.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.init();
  runApp(
    const App(),
  );
}


