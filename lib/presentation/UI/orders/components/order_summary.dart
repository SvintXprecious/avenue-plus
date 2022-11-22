import 'package:avenue_manager/config/colors.dart';
import 'package:avenue_manager/presentation/widgets/widgets.dart';
import 'package:avenue_manager/util/number_format.dart';
import 'package:flutter/material.dart';

import '../../../../util/dimensions.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key, required this.subtotal, required this.deliveryFee, required this.total}) : super(key: key);
  final String subtotal;
  final String deliveryFee;
  final String total;

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);
    return Container(
      padding:EdgeInsets.only(top:dimensions.verticalPadding5 ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Typographic(text: "Order Summary",size: dimensions.font17,),
          SizedBox(height:dimensions.sizedBox5,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Typographic(text: "Subtotal",size: dimensions.font14,color: AvenueColors.typographyGrey,),
              Typographic(
                text: "MWK ${decimalPattern.format(int.parse(subtotal))}.00",
                size: dimensions.font14,
                color: AvenueColors.typographyGrey,)
            ],
          ),
          SizedBox(height:dimensions.sizedBox5,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Typographic(text: "Delivery",size: dimensions.font14,color: AvenueColors.typographyGrey,),
              Typographic(text: "MWK $deliveryFee",size: dimensions.font14,color: AvenueColors.typographyGrey,)
            ],
          ),
          SizedBox(height:dimensions.sizedBox5,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Typographic(
                text: "Total",
                size: dimensions.font14,
                color: AvenueColors.typographyGrey,),
              Typographic(
                text: "MWK ${decimalPattern.format(int.parse(total))}.00",
                size: dimensions.font14,
                fontWeight: FontWeight.bold,
                color: AvenueColors.typographyBlueAccent,)



            ],
          )


        ],
      ),
    );
  }
}
