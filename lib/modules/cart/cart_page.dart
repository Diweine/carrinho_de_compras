import 'package:sacola_de_compras/modules/cart/cart_controller.dart';
import 'package:sacola_de_compras/shared/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sacola_de_compras/exports_libs.dart';

class CartPage extends StatefulWidget {
  final CartController controller;
  CartPage({Key? key, required this.controller}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sacola de Compras'),
        ),
        bottomSheet: widget.controller.list.isEmpty
            ? Center(
                child: Text(
                "Sua sacola está vazia.",
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
            : Observer(builder: (_) {
                return widget.controller.list.isNotEmpty
                    ? Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "Total da sacola:",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  widget.controller.cartPrice,
                                  style: Theme.of(context).textTheme.headline6,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : Text("");
              }),
        body: Observer(builder: (_) {
          return widget.controller.list.isEmpty
              ? Center(
                  child: Text(
                    "Sua sacola está vazia.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              : ListView.builder(
                  itemCount: widget.controller.list.length,
                  itemBuilder: (_, index) => Card(
                    child: Column(
                      children: [
                        ListTile(
                          title:
                              Text(widget.controller.list[index].product.name),
                          trailing: Text(widget
                              .controller.list[index].product.price
                              .reais()),
                          onTap: () {},
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text("Valor Total : " +
                                  widget.controller.list[index].totalPrice),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    child: IconButton(
                                      onPressed: () =>
                                          widget.controller.removeItem(
                                        widget.controller.list[index].product,
                                      ),
                                      icon: Icon(Icons.remove),
                                      color: Colors.white,
                                      iconSize: 15.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: AppColors.verde,
                                    ),
                                    width: 32.0,
                                    height: 32.0,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0, vertical: 8.0),
                                      child: Text(
                                        widget.controller.list[index].quantity
                                            .toString(),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Container(
                                    child: IconButton(
                                      onPressed: () => widget.controller
                                          .addItem(widget
                                              .controller.list[index].product),
                                      icon: Icon(
                                        Icons.add,
                                      ),
                                      color: Colors.white,
                                      iconSize: 15.0,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: AppColors.verde),
                                    width: 32.0,
                                    height: 32.0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
        }));
  }
}
