import 'package:avenue_manager/config/colors.dart';
import 'package:avenue_manager/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../../util/dimensions.dart';

class DeliverySummary extends StatelessWidget {
  const DeliverySummary({
    Key? key,
    required this.customerName,
    required this.address,
    this.city="Thyolo",
    this.country="Malawi",}) : super(key: key);

  final String customerName;
  final String address;
  final String? city;
  final String? country;

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);
    return Container(
      padding: EdgeInsets.only(top: dimensions.verticalPadding5,bottom:dimensions.verticalPadding10 ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Typographic(text: "Delivery",size: dimensions.font17,),
          SizedBox(height:dimensions.sizedBox5,),
          Typographic(text: "Address:",size: dimensions.font12,color: AvenueColors.typographyGrey,),
          SizedBox(height:dimensions.sizedBox5,),
          Typographic(text: customerName,size: dimensions.font14,),
          SizedBox(height:dimensions.sizedBox5,),
          Typographic(text: address,size: dimensions.font14,),
          SizedBox(height:dimensions.sizedBox5,),
          Typographic(text: "$city, $country",size:dimensions.font14 ,)

        ],
      ),
    );
  }
}
