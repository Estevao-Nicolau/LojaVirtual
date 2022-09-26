import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:lojavirtual/src/config/app_data.dart' as appData;
import 'package:lojavirtual/src/pages/orders/view/components/order_title.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pedidos')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (_, index) => SizedBox(height: 10),
        itemBuilder: (_, index) => OrderTile(
          order: appData.orders[index],
        ),
        itemCount: appData.orders.length,
      ),
    );
  }
}
