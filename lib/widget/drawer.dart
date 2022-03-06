import 'package:app_licman/Repository/updateResourcesRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../const/Colors.dart';
import '../ui/cola_actas_page.dart';

class MyDrawer extends StatelessWidget {
  double fontSizeDrawHeader= 25;
  double fontSizeItem = 20;
  @override
  Widget build(BuildContext context) {
    final ProgressDialog pr = ProgressDialog(context);
    pr.style(
        message: 'Actualizando...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,


        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
    );
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
            title:  Text('Actas sin enviar',style: TextStyle(fontSize: fontSizeItem),),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ColaActaPage()));
            },
          ),
          ListTile(
            title:  Row(
              children: [
                Icon(Icons.refresh),
                const SizedBox(width: 10,),
                Text('Actualizar  ',style: TextStyle(fontSize: fontSizeItem),),
              ],
            ),
            onTap: () async {
              await pr.show();
              UpdateStateRepository().update(context);
              await Future.delayed(Duration(milliseconds: 700));
              await pr.hide();
              Navigator.pop(context);
            },
          ),


        ],
      ),
    );
  }
}