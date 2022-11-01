
import 'package:flutter/material.dart';
import 'package:polycoffee/constants.dart';
import 'package:polycoffee/models/order_table.dart';

class CardShortView extends StatelessWidget {
  CardShortView({Key? key, this.table}) : super(key: key);

  final OrderTable? table;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: cartBarHeight,
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Row(
        children: [
          Text("Hoa don", style: Theme.of(context).textTheme.headline6,),
          const SizedBox(width: defaultPadding,),
          Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(table!.listProductItem.length, (index) =>
                    Padding(
                        padding: const EdgeInsets.only(right: defaultPadding / 2),
                        child: Hero(
                          tag: table!.listProductItem[index].product.id+"_cartTag",
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                            AssetImage(table!.listProductItem[index].product.img),
                          ),
                        ),
                    )
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
