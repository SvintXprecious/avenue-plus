import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/blocs/orders/orders_bloc.dart';
import '../../../util/dimensions.dart';
import 'components/orders_carousel.dart';

class OrdersBodyView extends StatelessWidget {
  OrdersBodyView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Dimensions dimensions = Dimensions(context: context);

    return Container(
      margin: EdgeInsets.only(
        left: dimensions.horizontalPadding20,
        right: dimensions.horizontalPadding20,
      ),
      child: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          if(state is OrderLoading){
            return const Center(child: CircularProgressIndicator());

          }
          if(state is OrderLoaded){
            return ListView.builder(
                itemCount: state.orders.length,
                itemBuilder: (context, index) =>
                    OrdersCarousel(orders: state.orders[index],));
          }
          else{return const Text("");}

        },
      ),

    );
  }
}
