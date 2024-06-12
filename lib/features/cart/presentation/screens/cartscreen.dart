import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/bloc/home_bloc.dart';
import '../bloc/cart_bloc.dart';
import '../widgets/cart_tile_widget.dart';

class CartScreen extends StatefulWidget {
  final HomeBloc homeBloc; // Add HomeBloc reference

  const CartScreen({super.key, required this.homeBloc});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartBloc cartBloc;

  @override
  void initState() {
    cartBloc = CartBloc(widget.homeBloc); // Initialize with HomeBloc
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Items'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                  itemCount: successState.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartTileWidget(
                        cartBloc: cartBloc,
                        cartDataModel: successState.cartItems[index]);
                  });

            default:
          }
          return Container();
        },
      ),
    );
  }
}