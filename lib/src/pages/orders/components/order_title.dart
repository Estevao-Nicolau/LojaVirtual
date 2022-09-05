import 'package:flutter/material.dart';
import 'package:lojavirtual/src/models/cart_item_model.dart';
import '../../../models/order_model.dart';
import '../../../services/utils_services.dart';
import 'order_status_widget.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;

  OrderTile({Key? key, required this.order}) : super(key: key);

  final UtilsServices utilsServices = new UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: order.status == 'pending_payment',
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pedido: ${order.id}'),
              Text(
                utilsServices.formatDateTime(order.createdDateTime),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  // Lista de Produtos
                  Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 150,
                        child: ListView(
                            children: order.items.map((e) {
                          return _OrderitemWidger(
                            utilsServices: utilsServices,
                            orderItem: e,
                          );
                        }).toList()),
                      )),
                  // Divisão
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 8,
                  ),

                  // Status do pedido
                  Expanded(
                      flex: 2,
                      child: OrderStatus(
                          status: order.status,
                          isOverdue:
                              order.overdueDateTime.isBefore(DateTime.now()))),
                ],
              ),
            ),
            // Total
            Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 20,
                ),
                children: [
                  TextSpan(
                    text: 'Total ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: utilsServices.priceToCurrency(order.total))
                ],
              ),
            ),
            // Botão Pagamento
            Visibility(
              visible: order.status == 'pending_payment',
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                icon: Image.asset(
                  '/Users/nicolaudev/Flutter_Projects/LojaVirtual/assets/pix.png',
                  height: 18,
                ),
                label: Text('Ver Qr Code Pix'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _OrderitemWidger extends StatelessWidget {
  const _OrderitemWidger({
    Key? key,
    required this.utilsServices,
    required this.orderItem,
  }) : super(key: key);

  final UtilsServices utilsServices;

  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit} ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(orderItem.item.itemName)),
          Text(utilsServices.priceToCurrency(orderItem.totalPrice()))
        ],
      ),
    );
  }
}
