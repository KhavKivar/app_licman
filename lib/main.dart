import 'package:app_licman/model/state/equipoState.dart';
import 'package:app_licman/ui/acta_general_page.dart';
import 'package:app_licman/ui/acta_inspeccion_page.dart';
import 'package:app_licman/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'const/Colors.dart';
import 'model/state/actaState.dart';
import 'model/state/commonVarState.dart';

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
        ChangeNotifierProvider(create: (context) => ActaState()),
        ChangeNotifierProvider(create: (context) => CommonState()),
      ],
      child: MaterialApp(
        title: 'Licman App',
          debugShowCheckedModeBanner: false,
        theme:ThemeData(fontFamily: 'Poppins',
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor:yellowBackground
        ),
        home: Homepage()
      ),
    );
  }
}
