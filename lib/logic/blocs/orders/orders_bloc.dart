import 'dart:async';

import 'package:avenue_manager/logic/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:avenue_manager/data/repository/repository.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrderEvent, OrdersState> {
  final OrderRepository _productRepository;
  StreamSubscription? _productSubscription;

  OrdersBloc({required  OrderRepository orderRepository})
      : _productRepository = orderRepository, super(OrderLoading()) {
    on<LoadOrders>(_onLoadOrders);
    on<UpdateOrders>(_onUpdateOrders);
  }

  void _onLoadOrders(LoadOrders event, Emitter<OrdersState> emit) {
    _productSubscription?.cancel();
    _productSubscription = _productRepository
        .getOrders()
        .listen((orders) => add(UpdateOrders(orders)),
    );

  }

  void _onUpdateOrders(UpdateOrders event,Emitter<OrdersState> emit) {
    emit(OrderLoaded(orders: event.orders));
  }
}

