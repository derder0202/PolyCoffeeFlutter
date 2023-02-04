
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:polycoffee/constants.dart';
import 'package:polycoffee/models/order_table.dart';
import 'package:polycoffee/models/product_item.dart';
import 'package:polycoffee/pages/ordering/components/details_product/price.dart';
import 'package:polycoffee/pages/ordering/table_controller.dart';

class CardDetailViewCard extends StatelessWidget {
  const CardDetailViewCard({Key? key, required this.productItem, required this.table}) : super(key: key);

  final ProductItem productItem;
  final OrderTable table;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Slidable(
        endActionPane: ActionPane(
            extentRatio: 0.2,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (contextAction){
                    TableController.to.removeQuantityProductOrdering(productItem, table);
                   print(TableController.to.listTable.elementAt(int.parse(table.id)).listProductItem.length);
                },
                backgroundColor: defaultBgColor,
                foregroundColor: Colors.black45,
                icon: Icons.remove_circle,
                //borderRadius: BorderRadius.circular(10),
                autoClose: false,
               // padding: EdgeInsets.only(right: 10),
              ),

            ]
        ),
        child: SizedBox(
          width: double.infinity,
          child: ListTile(
              //contentPadding: const EdgeInsets.symmetric(vertical: 10),
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(productItem.product.img),
              ),
              title: Text(
                productItem.product.name,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
              ),
              trailing: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Price(amount: productItem.product.price.toString()),
                    Text(' x ${productItem.quantity}',style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
          ),
        ),
      ),
    );
  }
}
