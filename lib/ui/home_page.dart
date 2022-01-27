import 'package:app_licman/const/Colors.dart';
import 'package:app_licman/model/equipo.dart';
import 'package:app_licman/model/state/commonVarState.dart';
import 'package:app_licman/model/state/equipoState.dart';
import 'package:app_licman/widget/bottomNavigator.dart';
import 'package:app_licman/widget/card_equipo_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

import 'acta_general_page.dart';
import 'card_equipo_detalle.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> with WidgetsBindingObserver {
  int choose = -1;
  double witt = 300;
  final searchController = TextEditingController();
  bool select = false;
  List? equipos;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    Provider.of<EquipoState>(context, listen: false).initState(context);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    print("dispose");
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    equipos = Provider.of<EquipoState>(context).filterListEquipo;

    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: const BottomNavigator(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [
            SvgPicture.asset(
              "assets/logo.svg",
              height: 35,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Buscar equipos..',
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.white,
                filled: true,
              ),
              onChanged: (value) {
                if (value == "") {
                  Provider.of<EquipoState>(context, listen: false).setFilter(
                      Provider.of<EquipoState>(context, listen: false).equipos);
                } else {
                  List<Equipo> equiposSearch =
                      Provider.of<EquipoState>(context, listen: false)
                          .equipos
                          .where((element) =>
                              element.id.toString().startsWith(value) ||
                              element.tipo
                                  .toLowerCase()
                                  .startsWith(value.toLowerCase()) ||
                              element.marca
                                  .toLowerCase()
                                  .startsWith(value.toLowerCase()) ||
                              element.modelo
                                  .toLowerCase()
                                  .startsWith(value.toLowerCase()))
                          .toList();
                  Provider.of<EquipoState>(context, listen: false)
                      .setFilter(equiposSearch);
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            (Provider.of<EquipoState>(context).loading)
                ? Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Loading",
                          style: TextStyle(color: dark, fontSize: 35),
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    height: 500,
                    child: ListView.builder(
                        itemCount: equipos?.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              onTap: (){
                                searchController.clear();
                                FocusScope.of(context).unfocus();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            cardEquipoDetalle(equipo:  equipos![index])));
                              },
                              child: CardEquipo(equipo: equipos![index]));
                        }),
                  ),
          ],
        ),
      ),
    ));
  }
}


