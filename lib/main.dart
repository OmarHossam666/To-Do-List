import 'package:hive_flutter/hive_flutter.dart';
import 'package:prodigy_ad_02/data/hive_data_store.dart';
import 'package:prodigy_ad_02/models/task.dart';
import 'package:prodigy_ad_02/views/home/widgets/home_view.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Hive.initFlutter();

  Hive.registerAdapter<Task>(TaskAdapter());

  // ignore: unused_local_variable
  Box box = await Hive.openBox<Task>(HiveDataStore.boxName);

  runApp(BaseWidget(child: const MainApp()));
}

class BaseWidget extends InheritedWidget {
  BaseWidget({super.key, required this.child}) : super(child: child);

  final HiveDataStore dataStore = HiveDataStore();
  // ignore: annotate_overrides, overridden_fields
  final Widget child;

  static BaseWidget of(BuildContext context) {
    final base = context.dependOnInheritedWidgetOfExactType<BaseWidget>();

    if (base != null) {
      return base;
    } 
    else {
      throw StateError('Could not find ancestor widget of type BaseWidget');
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
