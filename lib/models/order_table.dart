
import 'package:polycoffee/models/product_item.dart';

class OrderTable{
  String id,state;
  List<ProductItem> listProductItem;
  String orderStaff;

  OrderTable(this.id, this.state, this.listProductItem,this.orderStaff);
}