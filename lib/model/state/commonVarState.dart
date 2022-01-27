import 'package:flutter/cupertino.dart';

class CommonState extends ChangeNotifier{
    int selectIndex = 0;

    int actaSelectItem = 0;

    void changeIndex(int newIndex){
      selectIndex = newIndex;
      notifyListeners();
    }


    void changeActaIndex(int newIndex){
      actaSelectItem = newIndex;
      notifyListeners();
    }
}