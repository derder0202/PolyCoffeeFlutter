
import 'package:get/get.dart';
import 'package:polycoffee/models/order_table.dart';
import 'package:polycoffee/models/product_item.dart';

class TableController extends GetxController{

  static TableController get to => Get.find();

  var listTable = [
    OrderTable("0", 'state', [], 'orderStaff'),
    OrderTable("1", 'state', [], 'orderStaff'),
    OrderTable("2", 'state', [], 'orderStaff'),
    OrderTable("3", 'state', [], 'orderStaff'),
    OrderTable("4", 'state', [], 'orderStaff'),
    OrderTable("5", 'state', [], 'orderStaff'),
    OrderTable("6", 'state', [], 'orderStaff'),
    OrderTable("7", 'state', [], 'orderStaff'),
  ];

  OrderTable getTable(int id){
    return listTable[id];
  }

  void removeQuantityProductOrdering(ProductItem productItem, int indexTable){
      if(productItem.quantity == 1){
          listTable[indexTable].listProductItem.remove(productItem);
      } else if(productItem.quantity>1){
        listTable[indexTable].listProductItem.firstWhere((element) => element.product.id == productItem.product.id).quantity--;
      }
      update();
  }


}