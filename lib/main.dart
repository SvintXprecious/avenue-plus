import 'package:avenue_manager/presentation/UI/orders/orders_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:avenue_manager/config/config.dart';
import 'package:avenue_manager/data/repository/repository.dart';
import 'logic/blocs/orders/orders_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => OrdersBloc(orderRepository: OrderRepository())..add(LoadOrders()),
      ),
    ],
      child: const MaterialApp(
        title: 'Avenue+',
        debugShowCheckedModeBanner: false,
        home: OrdersUI(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: OrdersUI.routeName,

      ),
    );

  }
}




