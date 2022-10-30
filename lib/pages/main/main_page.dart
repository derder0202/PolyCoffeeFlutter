
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polycoffee/constants.dart';
import 'package:polycoffee/pages/main/components/header.dart';
import 'package:polycoffee/pages/menu/menu_page.dart';
import 'package:polycoffee/pages/ordering/ordering_page.dart';
import 'package:polycoffee/pages/revenue/revenue_page.dart';
import 'package:polycoffee/pages/user/user_page.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final _selectIndex = 0.obs;
  final PageController _pageController = PageController();

  final listItem = <Widget>[
    UserPage(),
    MenuPage(type: 0,),
    OrderingPage(),
    RevenuePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, BoxConstraints constraints) {
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  height: headerHeight,
                  child: MainHeader(selectIndex: _selectIndex,),
                ),
                Positioned(
                    top: headerHeight,
                    right: 0,
                    left: 0,
                    height: constraints.maxHeight-headerHeight,
                    child: PageView(
                      controller: _pageController,
                      children: listItem,
                    ),
                )
              ],
            );
          }
        ),
      ),
      bottomNavigationBar: Obx(()=>Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: BottomNavigationBar(
            backgroundColor: Colors.brown[600],
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.manage_accounts),label: "QLTK"),
              BottomNavigationBarItem(icon: Icon(Icons.emoji_food_beverage),label: "Menu"),
              BottomNavigationBarItem(icon: Icon(Icons.table_restaurant),label: "Bàn"),
              BottomNavigationBarItem(icon: Icon(Icons.attach_money),label: "Doanh thu"),
            ],
            currentIndex: _selectIndex.value,
            onTap: (index){
              _pageController.animateToPage(index, duration: const Duration(milliseconds: 400), curve: Curves.easeOut);
              _selectIndex.value = index;
            },
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),)
    );
  }
}
