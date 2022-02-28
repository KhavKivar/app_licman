import 'dart:typed_data';

import 'package:app_licman/const/Colors.dart';
import 'package:app_licman/model/state/actaState.dart';

import 'package:app_licman/plugins/dart_rut_form.dart';
import 'package:app_licman/widget/bottomNavigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

class actaGeneralPartTwo extends StatefulWidget {
  const actaGeneralPartTwo({Key? key}) : super(key: key);

  @override
  _actaGeneralPartTwoState createState() => _actaGeneralPartTwoState();
}

class _actaGeneralPartTwoState extends State<actaGeneralPartTwo>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; //
  TextEditingController? rutController;
  TextEditingController? nameController;
  TextEditingController? obvController;

  @override
  void initState() {
    super.initState();
    rutController = TextEditingController(
        text: Provider.of<ActaState>(context, listen: false).MapOfValue['rut']);
    nameController = TextEditingController(
        text: Provider.of<ActaState>(context, listen: false).MapOfValue['name']);
    obvController = TextEditingController(
        text: Provider.of<ActaState>(context, listen: false).MapOfValue['obv']);
  }

  @override
  void dispose() {
    super.dispose();
    rutController?.dispose();
    nameController?.dispose();
    obvController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
      child: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: rutController,
                    onChanged: (value) {
                      Provider.of<ActaState>(context, listen: false)
                          .setRut(value);
                      RUTValidator.formatFromTextController(rutController!);
                    },
                    style: TextStyle(color: dark, fontSize: 23),
                    keyboardType: TextInputType.number,
                    maxLength: 12,
                    decoration: const InputDecoration(
                        counterText: '',
                        fillColor: Colors.white,
                        filled: true,
                       border: OutlineInputBorder(),
                        hintText: 'Rut',
                        prefixIcon: Icon(
                          Icons.person,
                          size: 30,
                        )),
                  ),
                ),
                const SizedBox(width: 30,),
                Expanded(
                  child: TextField(
                    controller: nameController,
                    onChanged: Provider.of<ActaState>(context).setName,
                    style: TextStyle(color: dark, fontSize: 23),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      hintText: 'Nombre recepcionista',
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),
            TextField(
              controller: obvController,
              onChanged: Provider.of<ActaState>(context).setObv,
              minLines: 3,
              maxLines: 5,
              style: TextStyle(color: dark, fontSize: 23),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(),
                hintText: 'Observaciones',
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
