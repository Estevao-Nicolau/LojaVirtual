import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lojavirtual/src/config/theme_colors.dart';
import 'package:lojavirtual/src/models/cart_item_model.dart';
import 'package:lojavirtual/src/pages/cart/components/cart_tile.dart';
import 'package:lojavirtual/src/services/utils_services.dart';
import 'package:lojavirtual/src/config/app_data.dart' as appData;

class CartTab extends StatefulWidget {
  CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();

  void removeItemFromCart(CartItemModel cartItem) {
    setState(() {
      appData.cartItems.remove(cartItem);
    });
  }

  double cartTotalPrice() {
    double total = 0;
    for (var item in appData.cartItems) {
      total += item.totalPrice();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carrinho')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: appData.cartItems.length,
              itemBuilder: (_, index) {
                return CartTile(
                  cartItem: appData.cartItems[index],
                  remove: removeItemFromCart,
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 3,
                    spreadRadius: 2,
                  ),
                ]),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Total geral',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    utilsServices.priceToCurrency(cartTotalPrice()),
                    style: TextStyle(
                        fontSize: 23,
                        color: CustomColors.customSwathColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Concluir pedido',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
