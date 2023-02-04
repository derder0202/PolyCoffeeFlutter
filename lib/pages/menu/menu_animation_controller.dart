
import 'package:flutter/cupertino.dart';
import 'package:polycoffee/models/order_table.dart';
import 'package:polycoffee/pages/ordering/table_controller.dart';

import '../../models/product.dart';
import '../../models/product_item.dart';

enum MenuAnimationState{normal,cart}

class MenuAnimationController extends ChangeNotifier{
  MenuAnimationState state = MenuAnimationState.normal;

  void changeTo(MenuAnimationState menuState){
    state = menuState;
    notifyListeners();
  }

  void addProductToCart(Product product,OrderTable table,int number){
    for(ProductItem item in table.listProductItem){
      if(item.product.id == product.id){
        item.quantity+=number;
        notifyListeners();
        return;
      }
    }
    table.listProductItem.add(ProductItem(product,number));
    print(TableController.to.listTable.elementAt(int.parse(table.id)).listProductItem.length);
    notifyListeners();
  }

}