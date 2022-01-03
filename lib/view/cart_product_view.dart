import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_using_provider/provider/cart_notifier.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Consumer<CartNotifier>(
        builder: (context, cartList, _) {
          return ListView.builder(
              itemCount: cartList.cartList.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Image.network(cartList.cartList[index].itemsImage),
                      Text(cartList.cartList[index].itemsName),
                      Text(cartList.cartList[index].itemsPrice),
                    ],
                  ),
                );
              });
        },
      ),
    ));
  }
}
