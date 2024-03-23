import 'package:fend_flutter/screens/tasks_overview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(255, 131, 22, 0.5), 
    brightness: Brightness.dark
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main(){
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