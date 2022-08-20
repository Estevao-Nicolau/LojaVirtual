import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lojavirtual/src/models/cart_item_model.dart';
import 'package:lojavirtual/src/pages/common_widgets/quantity_widgets.dart';
import 'package:lojavirtual/src/services/utils_services.dart';

class CartTile extends StatelessWidget {
  final CartItemModel cartItem;

  CartTile({
    Key? key,
    required this.cartItem,
  }) : super(key: key);
  final UtilsServices utilsServices = UtilsServices();
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(20, 4, 20, 0), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          // Imagem
          leading: Image.network(cartItem.item.imageUrl, height: 60, width: 60),
          // Titulo
          title: Text(
            cartItem.item.itemName,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          // Total
          subtitle: Text(utilsServices.priceToCurrency(cartItem.totalPrice()),
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              )),
          // Quantidade
          trailing: QuantityWidget(
            value: cartItem.quantity,
            suffixText: cartItem.item.unit,
            result: (quantity) {},
          ),
        ));
  }
}
