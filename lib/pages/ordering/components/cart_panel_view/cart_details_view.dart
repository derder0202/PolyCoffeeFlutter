import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polycoffee/constants.dart';
import 'package:polycoffee/models/order_table.dart';
import 'package:polycoffee/pages/ordering/components/cart_panel_view/cart_details_view_card.dart';
import 'package:polycoffee/pages/ordering/table_controller.dart';

class CardDetailsView extends StatelessWidget {
  const CardDetailsView({Key? key, required this.table}) : super(key: key);

  final OrderTable table;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TableController>(builder: (tableController) {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hóa đơn", style: Theme
                  .of(context)
                  .textTheme
                  .headline6),
              ...List.generate(table.listProductItem.length, (index) =>
                  CardDetailViewCard(
                    productItem: table.listProductItem[index], table:table,)),
              const SizedBox(height: defaultPadding),
              SizedBox(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(15),
                      backgroundColor: Colors.brown[600]),
                  onPressed: () {},
                  child: const Text("ĐÃ THANH TOÁN"),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
