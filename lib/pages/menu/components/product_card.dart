
import 'package:flutter/material.dart';
import 'package:polycoffee/constants.dart';
import 'package:polycoffee/models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product, required this.press, required this.longPress}) : super(key: key);

  final Product product;
  final VoidCallback press;
  final VoidCallback longPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        onLongPress: longPress,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding,vertical: defaultPadding),
          decoration: const BoxDecoration(
            color: Color(0xFFF7F7F7),
            borderRadius: BorderRadius.all(Radius.circular(defaultPadding*1.25))
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Hero(
                  tag: product.id,
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Image(
                        fit: BoxFit.fitHeight,
                        image: AssetImage(product.img)
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(product.name,style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.w500)),
                      Text('${product.price} VND',style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black54,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
            ],
          ),
        ),

    );
  }
}
