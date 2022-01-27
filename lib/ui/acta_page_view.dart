import 'package:app_licman/const/Colors.dart';
import 'package:app_licman/model/state/commonVarState.dart';
import 'package:app_licman/ui/acta_general_page.dart';
import 'package:app_licman/ui/acta_general_part_3_page.dart';
import 'package:app_licman/widget/bottomNavigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'acta_general_part_2_page.dart';

class ActaPageView extends StatefulWidget {
  const ActaPageView({Key? key}) : super(key: key);

  @override
  _ActaPageViewState createState() => _ActaPageViewState();
}

class _ActaPageViewState extends State<ActaPageView> {



  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavigator(),
        body: PageView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                   SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: TopNavigator(controller: controller,)
                  ),
                   ActaGeneral(),
                ],
              ),
            ),
             Column(
               children: [
                 SizedBox(
                   height: 10,
                 ),
                 Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 50),
                     child: TopNavigator(controller: controller,)
                 ),
                 actaGeneralPartTwo(),
               ],
             ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: TopNavigator(controller: controller,)
                ),
                ActaGeneralPartThree(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TopNavigator extends StatefulWidget {
  const TopNavigator({Key? key, required this.controller}) : super(key: key);
  final PageController controller;
  @override
  _TopNavigatorState createState() => _TopNavigatorState();
}

class _TopNavigatorState extends State<TopNavigator> {
  var select;
  


  @override
  void didChangeDependencies() {
    select =  Provider.of<CommonState>(context).actaSelectItem;
  }

  final double fontSizeNav = 20.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Expanded(
              child: GestureDetector(
                onTap: (){
                  Provider.of<CommonState>(context,listen: false).changeActaIndex(0);
                  widget.controller.animateToPage(0,
                      duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
                },
                child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: select == 0 ? Colors.blueAccent: dark,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        )),
                    child:  RowNavigator(
                      iconData: Icons.assignment,
                      title: "Acta de inspeccion", fontSizeText: fontSizeNav,
                    )),
              )),
          Expanded(
              child: GestureDetector(
                onTap: (){
                  Provider.of<CommonState>(context,listen: false).changeActaIndex(1);
                  widget.controller.animateToPage(1,
                      duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
                },
                child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: select == 1 ? Colors.blueAccent: dark,
                    ),
                    child: RowNavigator(
                      iconData: Icons.person,
                      title: "Datos del cliente", fontSizeText: fontSizeNav,
                    )),
              )),
          Expanded(
              child: GestureDetector(
                onTap: (){
                  Provider.of<CommonState>(context,listen: false).changeActaIndex(2);
                  widget.controller.animateToPage(2,
                      duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
                },
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: select == 2 ? Colors.blueAccent: dark,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      )),
                  child: RowNavigator(
                    iconData: Icons.edit,
                    title: "Firma", fontSizeText: fontSizeNav,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}





class RowNavigator extends StatelessWidget {
  const RowNavigator({Key? key, required this.title, required this.iconData, required this.fontSizeText})
      : super(key: key);
  final String title;
  final IconData iconData;
  final double fontSizeText ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Icon(
          iconData,
          color: Colors.white,
          size: 30,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSizeText
          ),
        ),
      ],
    );
  }
}
