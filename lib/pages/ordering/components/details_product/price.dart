import 'package:flutter/material.dart';

import '../../../../constants.dart';

class Price extends StatelessWidget {
  const Price({
    Key? key,
    required this.amount,
  }) : super(key: key);
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(text: amount,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),
        children: [
          TextSpan(text: " VND",style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w600, color: Colors.black),)
        ],
      ),
    );
  }
}
