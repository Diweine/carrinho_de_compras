import 'package:sacola_de_compras/exports_libs.dart';
import 'package:sacola_de_compras/shared/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productData;

  const ProductCard({
    Key? key,
    required this.productData,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      color: AppColors.cinza,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(productData.image.toString()),
            Text(productData.name),
            Text(productData.price.toString()),
          ]),
    );
  }
}
