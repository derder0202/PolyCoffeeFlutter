
import 'package:polycoffee/models/product.dart';

class ProductItem{
  Product product;
  int quantity;

  ProductItem(this.product, this.quantity);

  void removeProduct(){
    quantity--;
  }

}

