import 'package:flutter/cupertino.dart';

class CommonState extends ChangeNotifier{
    int selectIndex = 0;

    int actaSelectItem = 0;

    List<int> categories = [1,2,4];
    int listaFiltro= 1;


    void changeSelectFiltro(int st){
      listaFiltro = st;
      notifyListeners();
    }
    void changeIndex(int newIndex){
      selectIndex = newIndex;
      notifyListeners();
    }
    void changeSelectCategories(List<int> newList){
      categories = newList;
      notifyListeners();
    }


    void changeActaIndex(int newIndex){
      actaSelectItem = newIndex;
      notifyListeners();
    }
}