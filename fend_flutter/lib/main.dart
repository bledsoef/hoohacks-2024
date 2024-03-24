import 'package:fend_flutter/screens/game_tasks.dart';
import 'package:fend_flutter/screens/tasks_overview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(255, 131, 22, 0.5), 
    brightness: Brightness.dark
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget{

  const App({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: TasksOverview(),
    );
  }

}