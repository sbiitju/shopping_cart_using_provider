import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_using_provider/provider/add_items_notifier.dart';
import 'package:shopping_cart_using_provider/provider/cart_notifier.dart';
import 'package:shopping_cart_using_provider/view/cart_product_view.dart';

import 'add_items.view.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<CartNotifier>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CartView();
              }));
            },
            label: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.shopping_cart_outlined),
                Text(_provider.cartList.length.toString())
              ],
            )),
        appBar: AppBar(
          title: const Text("Home"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) {
                            return AddItemsView();
                          }));
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: SafeArea(
          child: Container(
            height: 190,
            padding: const EdgeInsets.only(right: 20.0, left: 20, top: 2),
            child: Consumer<AddItemsProvider>(
              builder: (context, addItemNotifier, _) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: addItemNotifier.itemList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(
                                style: BorderStyle.solid,
                                width: 1,
                                color: Colors.green)),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.network(addItemNotifier
                                      .itemList[index].itemsImage
                                      .toString()),
                                ),
                                Text(addItemNotifier.itemList[index].itemsName),
                                Text("Price: " +
                                    addItemNotifier.itemList[index].itemsPrice +
                                    "\$"),
                                IconButton(
                                    onPressed: () {
                                      _provider.addCart(
                                          addItemNotifier.itemList[index]);
                                    },
                                    icon: Icon(
                                      Icons.add_shopping_cart_rounded,
                                      color: Colors.indigo,
                                    ))
                              ],
                            ),
                            SizedBox(
                              width: 2,
                            )
                          ],
                        ),
                      );
                    });
              },
            ),
          ),
        ));
  }
}
