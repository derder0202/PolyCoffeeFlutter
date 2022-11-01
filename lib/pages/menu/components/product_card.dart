
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:polycoffee/constants.dart';
import 'package:polycoffee/models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product, required this.press, required this.editAction, required this.removeAction, required this.enable}) : super(key: key);

  final Product product;
  final VoidCallback press;
  final VoidCallback editAction;
  final VoidCallback removeAction;
  final bool enable;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
          child: Slidable(
            enabled: enable,
          endActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                    onPressed: (context){editAction();},
                    backgroundColor: Color(0xFF0392CF),
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: 'Sửa',
                    borderRadius: BorderRadius.circular(10),
                    autoClose: true,
                ),
                SlidableAction(
                  onPressed: (context){removeAction();},
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Xóa',
                  borderRadius: BorderRadius.circular(10),
                  autoClose: true,
                ),

              ]
          ),
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
        ),

    );
  }
}
