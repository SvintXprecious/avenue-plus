
import 'package:avenue_manager/presentation/UI/orders/orders_ui.dart';
import 'package:flutter/material.dart';

class AppRouter{
  static Route onGenerateRoute(RouteSettings settings){

    switch(settings.name){


      case OrdersUI.routeName:
        return OrdersUI.route();




      default:
        return _errorRoute();

    }
  }

  static Route _errorRoute(){
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder:(_) => Scaffold(
          appBar: AppBar(title: const Text("error"),),
          body: const Center(child: Text("something went wrong")),
        ),);
  }
}