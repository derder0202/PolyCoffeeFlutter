
import 'package:get/get.dart';
import 'package:polycoffee/models/product.dart';

class MenuController extends GetxController{

  static MenuController get to => Get.find();

  var demo_products = [
    Product("0", "Cafe den", 50000, 1, "assets/images/cafe-den.jpg"),
    Product("1", "Cafe nau", 70000, 0, "assets/images/cafe-den.jpg"),
    Product("2", "tra sua socola", 35000, 0, "assets/images/cafe-den.jpg"),
    Product("3", "tra dao", 50000, 1, "assets/images/cafe-den.jpg"),
    Product("4", "Nuoc chanh", 50000, 1, "assets/images/cafe-den.jpg"),
  ];

  List<Product> getProductByType(int type){
     return demo_products.where((element) => element.type == type).toList();
  }

  void addProduct(Product product){
    demo_products.add(product);
    update();
  }
  void updateProduct(Product product){
    demo_products[int.parse(product.id)] = product;
    update();
  }


}