
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumberButton extends StatelessWidget {
  NumberButton({Key? key}) : super(key: key);
  var number = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(

            onPressed: (){},
            icon: Icon(Icons.remove)
        ),
        Obx(() => Text(number.value.toString())),
        IconButton(onPressed: (){}, icon: Icon(Icons.add))
      ],
    );
  }
}
