import 'dart:typed_data';

import 'package:app_licman/const/Colors.dart';
import 'package:app_licman/model/state/actaState.dart';
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

class _actaGeneralPartTwoState extends State<actaGeneralPartTwo> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true; //


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12, width: 1.0),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 2),
                ),
                hintText: 'Rut',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12, width: 1.0),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 2),
                ),
                hintText: 'Nombre recepcionista',
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              minLines: 4,
              maxLines: 5,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12, width: 1.0),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 2),
                ),
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
