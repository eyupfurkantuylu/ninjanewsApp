import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ninjanews/utils/generics/generics.dart';

import 'utils/routes/routes.dart';
import 'utils/routes/routes_name.dart';

void main() {
  initializeDateFormatting();
  runApp(StartPage());
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Widget? Start;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ninja News App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(Generics.ninjaNewsYellow),
        ),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.home,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
