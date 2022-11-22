part of 'orders_bloc.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object> get props => [];
}

class OrderLoading extends OrdersState {}

class OrderLoaded extends OrdersState {
  final List<Order> orders;

  OrderLoaded({this.orders = const <Order>[]});

  @override
  List<Object> get props => [orders];
}