import 'package:flutter/material.dart';
import 'package:lojavirtual/src/config/theme_colors.dart';
import 'package:lojavirtual/src/models/item_model.dart';
import 'package:lojavirtual/src/pages/common_widgets/quantity_widgets.dart';
import 'package:lojavirtual/src/services/utils_services.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({Key? key, required this.item}) : super(key: key);

  final ItemModel item;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final UtilsServices utilServices = UtilsServices();

  int cartItemQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(240),
      body: Stack(
        children: [
          // Conteúdo
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Imagem do produto
              Expanded(
                child: Hero(
                  tag: widget.item.imgUrl,
                  child: Image.network(widget.item.imgUrl),
                ),
              ),
              // Conteúdo do produto
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        offset: Offset(0, 10),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //  Nome - Quantidade
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.item.itemName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          QuantityWidget(
                            suffixText: widget.item.unit,
                            value: cartItemQuantity,
                            result: (int quantity) {
                              setState(() {
                                cartItemQuantity = quantity;
                              });
                            },
                          ),
                        ],
                      ),
                      // Preço do produto
                      Text(
                        utilServices.priceToCurrency(widget.item.price),
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customContrastColorLogo,
                        ),
                      ),
                      // Descrição do produto
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SingleChildScrollView(
                            child: Text(widget.item.decription,
                                style: TextStyle(
                                  height: 1.5,
                                )),
                          ),
                        ),
                      ),
                      // Botão add produto
                      SizedBox(
                        height: 40,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          )),
                          onPressed: () {},
                          label: Text('Adicionar no Carrinho',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                          icon: Icon(Icons.add_shopping_cart,
                              color: CustomColors.customContrastColor2),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Icon Botão de Sair
          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back_ios),
                color: CustomColors.customContrastColorLogo,
              ),
            ),
          ),
        ],
      ),
    );
  }
}