import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_using_provider/provider/add_items_notifier.dart';

class AddItemsView extends StatelessWidget {
  AddItemsView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _itemsNameController = TextEditingController();
  final _itemsPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AddItemsProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(30.00),
          child: Center(
            child: Column(
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          textAlign: TextAlign.center,
                          controller: _itemsNameController,
                          decoration: const InputDecoration(
                              label: Text("Items Name"),
                              hintText: "ex: Laptop",
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green,
                                      width: 2,
                                      style: BorderStyle.solid)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          textAlign: TextAlign.center,
                          controller: _itemsPriceController,
                          decoration: const InputDecoration(
                              label: Text("Items price"),
                              hintText: "ex: 2000\$",
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20)),
                                  borderSide: BorderSide(
                                      color: Colors.green,
                                      width: 2,
                                      style: BorderStyle.solid)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  color: Colors.green,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      provider.addItems(
                          _itemsNameController.text.trim(),
                          _itemsPriceController.text.trim(),
                          "https://picsum.photos/250?image=${provider.imageCounnter}");
                      _itemsPriceController.text = "";
                      _itemsNameController.text = "";
                    } else {
                      return;
                    }
                  },
                  child: const Text("Add Item"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
