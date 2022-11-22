import 'package:avenue_manager/config/colors.dart';
import 'package:avenue_manager/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../../../util/dimensions.dart';
import 'orders_body_view.dart';

class OrdersUI extends StatelessWidget {
  static const String routeName='/orders';

  static Route route(){
    return MaterialPageRoute(
      settings:const RouteSettings(name: routeName),
      builder: (_) => const OrdersUI(),);
  }
  const OrdersUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context: context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: dimensions.toolbarHeight65,
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AvenueColors.backgroundColorLightGray,
        title: Padding(
          padding: EdgeInsets.only(top: dimensions.verticalPadding10,),
          child: Typographic(text: "Orders",size: 18,),),
      ),
      body: OrdersBodyView(),


    );
  }
}
