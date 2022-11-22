import 'package:avenue_manager/logic/models/models.dart';
import 'package:avenue_manager/data/repository/order/base_order_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderRepository extends BaseOrderRepository {
  final FirebaseFirestore _firebaseFirestore;

  OrderRepository({FirebaseFirestore? firebaseFirestore}) :
        _firebaseFirestore=firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Order>> getOrders() {
    return _firebaseFirestore
        .collection('Checkout')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Order.fromSnapshot(doc)).toList();
    });
  }
}