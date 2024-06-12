import 'package:flutter/material.dart';
import '../../domain/entity/cart_model.dart';
import '../bloc/cart_bloc.dart';

class CartTileWidget extends StatelessWidget {
  final CartDataModel cartDataModel;
  final CartBloc cartBloc;
  const CartTileWidget({
    Key? key,
    required this.cartDataModel,
    required this.cartBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  cartDataModel.imageUrl,
                  width: 70,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartDataModel.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  const SizedBox(height: 8.0),
                  Text(
                    'Quantity: ${cartDataModel.quantity}',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5, right: 0),
                  child: Text(
                    '\$${(cartDataModel.price * cartDataModel.quantity).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color.fromARGB(255, 7, 134, 81),
                    ),
                  ),
                ),
                // const SizedBox(height: 24.0),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: IconButton(
                    icon: const Icon(Icons.delete),
                    color: Colors.redAccent,
                    tooltip: 'Remove from cart',
                    onPressed: () {
                      cartBloc.add(
                        CartRemoveFromCartEvent(cartDataModel: cartDataModel),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
