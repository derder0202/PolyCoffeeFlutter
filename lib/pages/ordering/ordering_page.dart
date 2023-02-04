
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:polycoffee/constants.dart';
import 'package:polycoffee/pages/ordering/components/ordering_table_card.dart';
import 'package:polycoffee/pages/ordering/table_controller.dart';

class OrderingPage extends StatelessWidget {
  OrderingPage({Key? key}) : super(key: key);
  final tableController = Get.put(TableController());
  final indexTable = 0.obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TableController>(
      builder: (tableController) {
        return Container(
          color: Colors.brown[100],
          padding: const EdgeInsets.all(defaultPadding),
          child: GridView.builder(
              itemCount: tableController.listTable.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: defaultPadding,
                  crossAxisSpacing: defaultPadding,
                  childAspectRatio: 1,
              ),
              itemBuilder: (context,index) => OrderingTableCard(table: tableController.listTable[index],)
          ),
        );
      }
    );
  }
}
