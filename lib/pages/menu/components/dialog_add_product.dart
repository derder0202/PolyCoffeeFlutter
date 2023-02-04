
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polycoffee/models/product.dart';
import 'package:polycoffee/pages/menu/menu_controller.dart';

class DialogAddProduct extends StatelessWidget {
  DialogAddProduct({Key? key, this.product}) : super(key: key){
    if(product!=null){
      _name.text = product!.name;
      _price.text = product!.price.toString();
    }
  }

  final Product? product;

  final TextEditingController _name = TextEditingController();
  final TextEditingController _price = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      child: product == null ?
                      const Icon(Icons.add_photo_alternate_outlined, size: 60,):
                      Image(
                            image: AssetImage(product!.img),
                            width: constraints.maxWidth/5,
                          height: constraints.maxWidth/5,
                      ),
                    onTap: (){
                        //open image picker here
                    },
                  ),
                  TextField(
                    controller: _name,
                    decoration: const InputDecoration(
                      labelText: "Tên sản phẩm",
                      contentPadding: EdgeInsets.symmetric(horizontal: 5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: TextField(
                      controller: _price,
                      decoration: const InputDecoration(
                        labelText: "Giá",
                        contentPadding: EdgeInsets.symmetric(horizontal: 5),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.brown[600]),
                      onPressed: (){
                          product == null?
                          MenuControllerGet.to.addProduct(Product(MenuControllerGet.to.demoProducts.length.toString(), _name.text, int.parse(_price.text), 2, "assets/images/cafe-nau.jpg")) :
                          MenuControllerGet.to.updateProduct(Product(product!.id.toString(), _name.text, int.parse(_price.text), product!.type, "assets/images/cafe-nau.jpg"));
                          Get.back();
                      },
                      child: Padding(padding: const EdgeInsets.all(10),child: Text(product == null ?"THÊM":"SỬA",style: const TextStyle(fontSize: 15),)))
                ],
              ),
            )
        );
      }
    );
  }
}
