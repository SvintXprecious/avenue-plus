import 'package:avenue_manager/presentation/UI/orders/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:avenue_manager/logic/models/models.dart';

class OrderItems extends StatelessWidget {
  const OrderItems({Key? key, required this.order,}) : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
          itemCount: order.products.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context,index) =>ProductCard(productID: order.products[index], ),
      ),
    );
  }
}
//ProductCard(product: order.products[index],),