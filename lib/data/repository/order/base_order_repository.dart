import 'package:avenue_manager/logic/models/models.dart';

abstract class BaseOrderRepository{
  Stream<List<Order>> getOrders();
}