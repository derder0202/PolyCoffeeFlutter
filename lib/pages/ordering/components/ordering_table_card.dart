
import 'package:flutter/material.dart';
import 'package:polycoffee/constants.dart';
import 'package:polycoffee/models/order_table.dart';
import 'package:polycoffee/pages/menu/menu_page.dart';

class OrderingTableCard extends StatelessWidget {
  const OrderingTableCard({Key? key, required this.table}) : super(key: key);

  final OrderTable table;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 500),
                reverseTransitionDuration: Duration(milliseconds: 500),
                pageBuilder: (context,animation,secondAnimation) =>
                    FadeTransition(
                        opacity: animation,
                        child:  Scaffold(
                          appBar: AppBar(
                            title: const Text("Ordering",style: TextStyle(fontWeight: FontWeight.w600),),
                            backgroundColor: Colors.brown[700],
                          ),
                          body:  MenuPage(type: 1,table: table,),
                        ),
                    )
            )
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/ban.jpg"),opacity: 0.8),
            color: Color(0xFFF7F7F7),
            borderRadius: BorderRadius.all(
              Radius.circular(defaultPadding * 1.25),
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text('Bàn ${int.parse(table.id)+1}',style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w600),)
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(table.state,style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w600,color: Colors.blueAccent)),
                    Text(table.orderStaff,style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w600))
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
