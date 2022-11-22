import 'package:avenue_manager/config/colors.dart';
import 'package:avenue_manager/presentation/UI/orders/components/order_items.dart';
import 'package:avenue_manager/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../../../../util/dimensions.dart';
import 'delivery_summary.dart';
import 'order_summary.dart';
import 'package:avenue_manager/logic/models/models.dart';

class OrdersCarousel extends StatelessWidget {
  const OrdersCarousel({Key? key, required this.orders}) : super(key: key);
  final Order orders;

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);


    return Container(
      padding: EdgeInsets.only(
        top: dimensions.verticalPadding20,
        bottom:dimensions.verticalPadding20,
        left: dimensions.horizontalPadding6,
        right: dimensions.horizontalPadding6,),
      margin: EdgeInsets.only(bottom: dimensions.verticalPadding30,top:dimensions.verticalPadding30, ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          //border: Border.all(color: AvenueColors.borderOutlineBlueAccent),
          color: AvenueColors.backgroundColorLightGray,),
      child: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Typographic(
              text: "Order ID: ${orders.checkoutID}",
              size: dimensions.font18,),

            SizedBox(height: dimensions.sizedBox5,),

            Typographic(
              text: "${orders.createdAt.year}-${orders.createdAt.month}-${orders.createdAt.day}",
              size: dimensions.font14,
              color: AvenueColors.typographyGrey,),
            SizedBox(height: dimensions.sizedBox5,),

            const Divider(thickness: 1,color: AvenueColors.borderOutlineBlueAccent,),
            OrderItems(order: orders,),
            const Divider(thickness: 1,color: AvenueColors.borderOutlineBlueAccent,),
            DeliverySummary(
              address: orders.customerAddress['address'],
              customerName: orders.customerName,
              city: orders.customerAddress['city'],
              country: orders.customerAddress['country'],),
            const Divider(thickness: 1,color: AvenueColors.borderOutlineBlueAccent,),
            OrderSummary(deliveryFee: orders.deliveryFee, total: orders.total, subtotal:orders.subtotal,)




          ],
        ),
      ),

    );
  }
}
