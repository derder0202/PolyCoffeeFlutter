
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polycoffee/constants.dart';
import 'package:polycoffee/models/order_table.dart';
import 'package:polycoffee/models/product.dart';
import 'package:polycoffee/pages/menu/components/product_card.dart';
import 'package:polycoffee/pages/menu/menu_animation_controller.dart';
import 'package:polycoffee/pages/menu/menu_controller.dart';
import 'package:polycoffee/pages/ordering/components/cart_panel_view/cart_details_view.dart';
import 'package:polycoffee/pages/ordering/components/cart_panel_view/cart_short_view.dart';
import 'package:polycoffee/pages/ordering/components/details_product/details_product_page.dart';

import 'components/dialog_add_product.dart';

class MenuPage extends StatelessWidget {
  MenuPage({Key? key, required this.type, this.table}) : super(key: key);
  final int type;
  final _selectindex = 0.obs;
  final menuController = Get.put(MenuController());
  final controlerAnim = MenuAnimationController();
  final OrderTable? table;

  void _onVerticalGesture(DragUpdateDetails details){
    if(details.primaryDelta! >12){
      controlerAnim.changeTo(MenuAnimationState.normal);
    }
  }

  void openDialogEdit(Product product){
    Get.bottomSheet(
        DialogAddProduct(product: product,),
        enterBottomSheetDuration: Duration(milliseconds: 400),
        exitBottomSheetDuration: Duration(milliseconds: 400),
        backgroundColor: Colors.brown[200]
    );
  }
  void openDialogOrdering(Product product,BuildContext context){
    Navigator.push(context,
        PageRouteBuilder(
            transitionDuration: panelTransition,
            reverseTransitionDuration: panelTransition,
            pageBuilder: (context,animation,secondAnimation) => 
                FadeTransition(
                    opacity: animation,
                    child: DetailsProductPage(product: product, table: table!, menuController: controlerAnim)
                )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        color: Colors.brown[100],
        child: AnimatedBuilder(
          animation: controlerAnim,
          builder: (context, snapshot) {
            return LayoutBuilder(
                  builder: (context, BoxConstraints constraints) {
                    return Stack(
                      children: [
                        //tabbar
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 400),
                          top: controlerAnim.state == MenuAnimationState.normal? 0 : -50,
                          right: 0,
                          left: 0,
                          height: 50,
                          child: DefaultTabController(
                            length: 3,
                            child: Container(
                              color: Colors.brown[500],
                              child: TabBar(
                                  tabs: const <Widget>[
                                    Tab(text: "Đồ uống",),
                                    Tab(text: "Bánh ngọt",),
                                    Tab(text: "Đồ ăn vặt",)
                                  ],
                                  labelColor: Colors.white,
                                  labelStyle: const TextStyle(fontWeight: FontWeight.bold,),
                                  indicatorColor: Colors.white,
                                  onTap: (index){
                                    _selectindex.value = index;
                                  },
                              ),
                            ),
                          ),
                        ),

                        //cart gio hang
                        type==1?AnimatedPositioned(
                            duration: Duration(milliseconds: 400),
                            bottom: 0,
                            left: 0,
                            right: 0,
                            height: controlerAnim.state == MenuAnimationState.normal? cartBarHeight : constraints.maxHeight-cartBarHeight ,
                            child: GestureDetector(
                              onVerticalDragUpdate: _onVerticalGesture,
                              onTap: (){
                                controlerAnim.changeTo(MenuAnimationState.cart);
                              },
                              child: Container(
                                color: Color(0xFFEAEAEA),
                                alignment: Alignment.topLeft,
                                child: AnimatedSwitcher(
                                    duration: panelTransition,
                                    child: controlerAnim.state == MenuAnimationState.normal? CardShortView(table: table!) : CardDetailsView(table: table!,) ,
                                ),
                              ),
                            )

                        ):Container(),

                        //gridview
                        GetBuilder<MenuController>(
                          builder: (menuController) {
                            return AnimatedPositioned(
                                duration: Duration(milliseconds: 400),
                                right: 0,
                                left: 0,
                                top: controlerAnim.state == MenuAnimationState.normal? 50: -(constraints.maxHeight - cartBarHeight*2 - 50),
                                height: constraints.maxHeight-50-cartBarHeight,
                                child: Obx(()=> menuController.demo_products.where((element) => element.type == _selectindex.value).isNotEmpty?
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: GridView.builder(
                                        itemCount: menuController.demo_products.where((element) => element.type == _selectindex.value).length,
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1,
                                          childAspectRatio: 3,
                                          mainAxisSpacing: defaultPadding/2,
                                          crossAxisSpacing: defaultPadding,
                                        ),
                                        itemBuilder: (context,index) => ProductCard(
                                          product: menuController.demo_products.where((element) => element.type == _selectindex.value).elementAt(index),
                                          press: type == 1? ()=>openDialogOrdering(menuController.getProductByType(_selectindex.value)[index],context) :(){},
                                          editAction:  type == 0? ()=>openDialogEdit(menuController.getProductByType(_selectindex.value)[index]) :(){},
                                          removeAction: () {  }, enable: type==0?true:false,
                                          //longPress: type == 0? ()=>openDialogEdit(menuController.getProductByType(_selectindex.value)[index]) :(){},
                                        )
                                      ),
                                    ) : Container()
                                )
                            );
                          }
                        ),

                      ],
                    );
                  }
                );
          }
        ),
      ),
    );

  }
}

