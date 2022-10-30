
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polycoffee/constants.dart';
import 'package:polycoffee/pages/menu/components/dialog_add_product.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({Key? key, required this.selectIndex}) : super(key: key);

  final RxInt selectIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: headerHeight,
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hello",
                  style: Theme.of(context).textTheme.caption,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Text("User Name",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.black54),
                  ),
                )
              ],
            ),
            Obx(() => Row(
              children: [
                // Them
                selectIndex!=3?GestureDetector(
                  onTap: (){
                    switch(selectIndex.value){
                      case 0:
                        print("0");
                        break;
                      case 1:
                        // Get.defaultDialog(
                        //   content: DialogAddProduct(),
                        //   title: "Thêm sản phẩm",
                        //   titlePadding: const EdgeInsets.fromLTRB(0, defaultPadding, 0, 0),
                        //   contentPadding: const EdgeInsets.all(20),
                        // );
                      Get.bottomSheet(
                          DialogAddProduct(),
                          enterBottomSheetDuration: Duration(milliseconds: 400),
                          exitBottomSheetDuration: Duration(milliseconds: 400),
                          backgroundColor: Colors.brown[200]
                      );
                        break;
                      case 2:
                        print("2");
                        break;
                      default:
                        break;
                    }
                  },
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xFFE3E2E3),
                    child: Icon(Icons.add),
                  ),
                ):Container(),
                // Profile dai dien
                GestureDetector(
                  onTap: (){},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                    ),
                  ),
                )
              ],
            ))
        ],
      ),
    );
  }
}
