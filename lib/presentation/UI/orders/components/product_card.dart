import 'package:avenue_manager/logic/models/models.dart';
import 'package:avenue_manager/util/number_format.dart';
import 'package:flutter/material.dart';

import 'package:avenue_manager/config/config.dart';
import '../../../../util/dimensions.dart';
import 'package:avenue_manager/presentation/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.productID, }) : super(key: key);
  final String productID;

  @override
  Widget build(BuildContext context) {

    Dimensions dimensions=Dimensions(context: context);
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection("Products").doc(productID).get(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if(snapshot.hasError){return Text("Something went  product");}
        if(snapshot.hasData && !snapshot.data!.exists){
          Text("Document does not exist");
        }
        if(snapshot.connectionState==ConnectionState.done){
          Map<String,dynamic> product=snapshot.data!.data() as Map<String,dynamic>;
          return Container(
            padding: EdgeInsets.only(
              bottom: dimensions.verticalPadding5,
              top: dimensions.verticalPadding5,),
            height: 100,
            width: double.maxFinite,
            child: Row(
              children: [
                Container(
                  height: double.maxFinite,
                  width: 90,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(product['imageUrl']),fit: BoxFit.cover,),
                  ) ,

                ),
                Expanded(
                  child: Container(
                    height: double.maxFinite,
                    padding: EdgeInsets.only(left: dimensions.horizontalPadding10),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Typographic(text: product['seller'],size: dimensions.font12,),

                        SizedBox(height: dimensions.sizedBox5,),
                        Typographic(text: product["name"].toString(),size: dimensions.font14,),

                        SizedBox(height: dimensions.sizedBox5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Typographic(text: "Qty: 1",size: dimensions.font14,color: AvenueColors.typographyGrey,),
                            Typographic(text: "Price: MWK ${decimalPattern.format(product['price'])}.00",size: dimensions.font14,),
                          ],
                        ),







                      ],
                    ),


                  ),)

              ],
            ),

          );
        }
        return Text("Loading");



      }
    );
  }
}
