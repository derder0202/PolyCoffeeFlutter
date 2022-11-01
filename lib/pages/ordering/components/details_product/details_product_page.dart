
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polycoffee/constants.dart';
import 'package:polycoffee/models/order_table.dart';
import 'package:polycoffee/models/product.dart';
import 'package:polycoffee/models/product_item.dart';
import 'package:polycoffee/pages/menu/menu_animation_controller.dart';
import 'package:polycoffee/pages/menu/menu_controller.dart';
import 'package:polycoffee/pages/ordering/components/details_product/price.dart';

class DetailsProductPage extends StatelessWidget {
  DetailsProductPage({Key? key, required this.product, required this.table, required this.menuController}) : super(key: key);
  final Product product;
  final OrderTable table;
  final MenuAnimationController menuController;
  var number = 0.obs;
  var cartTag = "".obs;



  final TextEditingController _ghichu = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.white,
          ),
          backgroundColor: Colors.brown,
          elevation: 0,
          centerTitle: true,
          title: Text(product.name,style: const TextStyle(color: Colors.white,),),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    //color: Color(0xFFF8F8F8),
                      child: Obx(() => Hero(
                        tag: product.id +cartTag.value,
                        child: Image(
                          image: AssetImage(product.img),
                          width: constraints.maxWidth/2,
                          height: constraints.maxWidth/2,
                        ),
                      ),)
                  ),
                  Container(
                      width: constraints.maxWidth/2,
                      color: Colors.brown[600],
                      //padding: const EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: (){if(number.value!=0)number.value--;},
                              icon: const Icon(Icons.remove),
                              color: Colors.white,
                          ),
                          Obx(() => Text(number.value.toString(),style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w600,color: Colors.white),)),
                          IconButton(onPressed: (){number.value++;}, icon: const Icon(Icons.add),color: Colors.white,)
                        ],
                      ),
                    ),
                  const SizedBox(height: defaultPadding * 1.5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: Text(product.name,style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Price(amount: product.price.toString()),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
                        child: Text(
                          "Cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the cole crops or brassicas, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and Savoy cabbage (var. sabauda).",
                          style: TextStyle(
                            color: Color(0xFFBDBDBD),
                            height: 1.8,
                          ),
                        ),
                      ),
                    ),
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.brown[700],),
                      onPressed: (){
                        if(number.value>0){
                          menuController.addProductToCart(product, table, number.value);
                          cartTag.value = "_cartTag";
                          Navigator.pop(context);
                        } else{
                          Get.snackbar(
                              "Error",
                              "Số lượng phải lớn hơn 0",
                              margin: EdgeInsets.all(20),
                          );
                        }
                      },
                      child: const Padding(padding: EdgeInsets.all(15),child: Text("THÊM",style: TextStyle(fontSize: 17),))
                  ),
                ],
              );
            }
          ),
        ),
    );
  }
}
