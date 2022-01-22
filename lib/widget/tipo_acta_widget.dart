import 'package:app_licman/ui/acta_inspeccion_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TipoActaWidget extends StatefulWidget {
  const TipoActaWidget({Key? key}) : super(key: key);

  @override
  _TipoActaWidgetState createState() => _TipoActaWidgetState();
}

class _TipoActaWidgetState extends State<TipoActaWidget> {
  int choose = -1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: (){setState(() {
            if(choose == -1){
              choose=0;
            }else{
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegisterPage()),
              );
            }

          });},
          child: AnimatedContainer(
            duration: Duration(seconds: 2),
            width: choose != -1 ? choose == 0 ? 800: 0 : 400,
            color: choose !=-1 ?choose == 0?  Colors.black:Colors.blue : Colors.blue,
            height:60,
            curve: Curves.ease,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(choose !=0)const Icon(Icons.assignment,color: Colors.white,),
                const SizedBox(width: 5),
                Text("Acta de inspeccion",style: TextStyle(color: Colors.white,fontSize: 30),),
                if(choose == 0)  Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
              ],
            ),
          ),
        ),
        if(choose == -1)const SizedBox(width: 20,),
        GestureDetector(
          onTap: (){setState(() {
            if(choose == -1){
              choose=1;
            }else{

            }

          });},
          child: AnimatedContainer(
            duration: Duration(seconds: 2),
            width:  choose != -1 ? choose == 1 ? 800: 0 : 400,
            color: choose !=-1 ?choose == 1?  Colors.black:Colors.blue : Colors.blue,
            height:60,
            curve: Curves.ease,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.assignment,color: Colors.white,),
                const SizedBox(width: 5),
                Text("Acta de electrica",style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
