import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/provider/project_provider.dart';
import 'package:time_tracker/provider/task_provider.dart';
import 'package:time_tracker/provider/time_entry_provider.dart';
import 'package:time_tracker/screens/home_screen.dart';
import 'package:time_tracker/theme/app_theme.dart';

late final ValueNotifier<int> notifier;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();
  runApp(MyApp(localStorage: localStorage));
}

class MyApp extends StatelessWidget {
  final LocalStorage localStorage;

  const MyApp({Key? key, required this.localStorage}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TimeEntryProvider(storage: localStorage),
        ),
        ChangeNotifierProvider(
          create: (_) => TaskProvider(storage: localStorage),
        ),
        ChangeNotifierProvider(
          create: (_) => ProjectProvider(storage: localStorage),
        ),
      ],
      child: MaterialApp(
        title: 'Time Tracker',
        theme: AppTheme.lightTheme,
        home: Scaffold(body: const HomeScreen()),
      ),
    );
  }
}
