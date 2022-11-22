import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Order extends Equatable{

  final List<String> products;
  final String deliveryFee;
  final String subtotal;
  final String total;
  final String customerName;
  final Map<String,dynamic> customerAddress;
  final DateTime createdAt;
  final String checkoutID;

  const Order( {
    required this.deliveryFee,
    required this.subtotal,
    required this.total,
    required this.customerName,
    required this.products,
    required this.customerAddress,
    required this.createdAt,
    required this.checkoutID  });

  factory Order.fromSnapshot(DocumentSnapshot snap){
    return Order(


        deliveryFee: snap['deliveryFee'],
        subtotal: snap['subtotal'],
        total: snap['total'],
        customerName: snap['customerName'],
        products:List<String>.from( snap["products"]),
        customerAddress: Map<String,dynamic>.from(snap['customerAddress']),
        createdAt:snap["createdAt"].toDate(),
        checkoutID:snap['checkoutID']

      );

  }



  @override

  List<Object?> get props => [

  deliveryFee,
  subtotal,
  total,customerName,products,customerAddress,checkoutID,createdAt];


}