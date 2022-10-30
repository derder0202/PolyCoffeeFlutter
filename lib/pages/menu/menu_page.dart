
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polycoffee/constants.dart';
import 'package:polycoffee/models/product.dart';
import 'package:polycoffee/pages/menu/components/product_card.dart';
import 'package:polycoffee/pages/menu/menu_controller.dart';

import 'components/dialog_add_product.dart';

class MenuPage extends StatelessWidget {
  MenuPage({Key? key, required this.type}) : super(key: key);
  final int type;
  final _selectindex = 0.obs;
  final menuController = Get.put(MenuController());
  void openDialogEdit(Product product){
    Get.bottomSheet(
        DialogAddProduct(product: product,),
        enterBottomSheetDuration: Duration(milliseconds: 400),
        exitBottomSheetDuration: Duration(milliseconds: 400),
        backgroundColor: Colors.brown[200]
    );
  }
  void openDialogOrdering(){
    print("dialog order");
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: LayoutBuilder(
          builder: (context, BoxConstraints constraints) {
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  height: 50,
                  child: Container(
                    color: Colors.brown[200],
                    child: TabBar(
                        tabs: const <Widget>[
                          Tab(text: "Đồ uống",),
                          Tab(text: "Bánh ngọt",),
                          Tab(text: "Đồ ăn vặt",)
                        ],
                        labelColor: Colors.black54,
                        labelStyle: const TextStyle(fontWeight: FontWeight.bold,),
                        indicatorColor: Colors.brown,
                        onTap: (index){
                          _selectindex.value = index;
                        },
                    ),
                  ),
                ),
                GetBuilder<MenuController>(
                  builder: (menuController) {
                    return Positioned(
                        right: 0,
                        left: 0,
                        top: 50,
                        height: constraints.maxHeight-50,
                        child: Obx(()=> menuController.demo_products.where((element) => element.type == _selectindex.value).isNotEmpty?
                            GridView.builder(
                              itemCount: menuController.demo_products.where((element) => element.type == _selectindex.value).length,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 3,
                                mainAxisSpacing: defaultPadding,
                                crossAxisSpacing: defaultPadding,
                              ),
                              itemBuilder: (context,index) => ProductCard(
                                product: menuController.demo_products.where((element) => element.type == _selectindex.value).elementAt(index),
                                press: type == 1? openDialogOrdering :(){},
                                longPress: type == 0? ()=>openDialogEdit(menuController.demo_products.where((element) => element.type == _selectindex.value).elementAt(index)) :(){},
                              )
                            ) : Container()
                        )
                    );
                  }
                )
              ],
            );
          }
        )
    );
  }
}

