import 'package:app_licman/model/state/equipoState.dart';
import 'package:app_licman/ui/acta_general_page.dart';
import 'package:app_licman/ui/acta_inspeccion_page.dart';
import 'package:app_licman/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EquipoState()),
      ],
      child: MaterialApp(
        title: 'Licman App',
          debugShowCheckedModeBanner: false,
        theme:ThemeData(primarySwatch: Colors.yellow),
        home:const ActaGeneral()
      ),
    );
  }
}
