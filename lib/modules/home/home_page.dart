import 'package:sacola_de_compras/exports_libs.dart';
import 'package:sacola_de_compras/modules/cart/cart_controller.dart';
import 'package:sacola_de_compras/modules/cart/cart_page.dart';
import 'package:sacola_de_compras/modules/home/home_controller.dart';
import 'package:sacola_de_compras/shared/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final cartController = CartController();

  @override
  void initState() {
    controller.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CartPage(
                    controller: cartController,
                  ),
                ),
              );
            },
            icon: Stack(
              children: [
                Icon(
                  Icons.shopping_bag,
                  size: 30,
                ),
                Observer(builder: (_) {
                  return (int.parse(cartController.listLength) > 0)
                      ? Align(
                          alignment: Alignment.topLeft,
                          child: CircleAvatar(
                              radius: 9,
                              backgroundColor: AppColors.vermelho,
                              foregroundColor: Colors.white,
                              child: Text(
                                cartController.listLength,
                                style: TextStyle(
                                  fontSize: 8,
                                ),
                              )),
                        )
                      : Text('');
                }),
              ],
            ),
          ),
        ],
      ),
      body: Observer(builder: (_) {
        if (controller.appStatus == AppStatus.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.appStatus == AppStatus.success) {
          return ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (_, index) => ListTile(
              title: Text(controller.products[index].name),
              trailing: Text(controller.products[index].price.reais()),
              onTap: () {
                cartController.addItem(controller.products[index]);
              },
            ),
          );
        } else if (controller.appStatus == AppStatus.empty) {
          return EmptyState();
        } else if (controller.appStatus == AppStatus.error) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Houve um problema",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .apply(color: Colors.red),
                ),
                Text(controller.errorMessage.isNotEmpty
                    ? controller.errorMessage
                    : controller.appStatus.message())
              ],
            ),
          );
        }
        return EmptyState();
      }),
    );
  }
}

class EmptyState extends StatelessWidget {
  const EmptyState({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Produtos indisponíveis no momento!",
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
