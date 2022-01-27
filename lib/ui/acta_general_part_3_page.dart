import 'dart:typed_data';

import 'package:app_licman/const/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class ActaGeneralPartThree extends StatefulWidget {
  const ActaGeneralPartThree({Key? key}) : super(key: key);

  @override
  _ActaGeneralPartThreeState createState() => _ActaGeneralPartThreeState();
}

class _ActaGeneralPartThreeState extends State<ActaGeneralPartThree> with AutomaticKeepAliveClientMixin{
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
    onDrawStart: () => print('onDrawStart called!'),
    onDrawEnd: () => print('onDrawEnd called!'),
  );
  var activar = false;
  @override
  bool get wantKeepAlive => true; //

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => print('Value changed'));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Stack(
            children: [
              Signature(
                controller: _controller,
                height: 300,
                backgroundColor: Colors.white,
              ),
              if (activar)
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0),
                ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color:dark,
                border: Border.all(color: Colors.white, width: 0.5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                //SHOW EXPORTED IMAGE IN NEW ROUTE
                IconButton(
                  icon: const Icon(Icons.check),
                  color: Colors.white,
                  onPressed: () async {
                    if (_controller.isNotEmpty) {
                      final Uint8List? data =
                      await _controller.toPngBytes();
                      if (data != null) {
                        setState(() {
                          activar = true;
                        });
                      }
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.undo),
                  color: Colors.white,
                  onPressed: () {
                    setState(() => _controller.undo());
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.redo),
                  color: Colors.white,
                  onPressed: () {
                    setState(() => _controller.redo());
                  },
                ),
                //CLEAR CANVAS
                IconButton(
                  icon: const Icon(Icons.clear),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      activar = false;
                      _controller.clear();
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                  ),
                  onPressed: () {

                  },
                  icon: Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 30,
                  ),
                  label: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Text(
                      "Enviar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ))),
        ],
      ),
    );
  }
}
