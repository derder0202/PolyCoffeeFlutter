
import 'package:flutter/material.dart';
import 'package:polycoffee/constants.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: headerHeight,
      color: Colors.white,
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello",
                  style: Theme.of(context).textTheme.caption,
                ),
                Text("User Name",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.black54),
                )
              ],
            ),
            
            const CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
            )
        ],
      ),
    );
  }
}
