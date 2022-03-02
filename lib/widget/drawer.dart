import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const/Colors.dart';
import '../ui/cola_actas_page.dart';

class MyDrawer extends StatelessWidget {
  double fontSizeDrawHeader= 25;
  double fontSizeItem = 20;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
           DrawerHeader(
            decoration: BoxDecoration(
              color: yellowBackground,
            ),
            child: Row(
              children: [

                Text('Configuraciones',style: TextStyle(fontSize: fontSizeDrawHeader),),
              ],
            ),
          ),
          ListTile(
            title:  Text('Estado de actas',style: TextStyle(fontSize: fontSizeItem),),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ColaActaPage()));
            },
          ),

        ],
      ),
    );
  }
}