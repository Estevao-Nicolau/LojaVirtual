import 'package:json_annotation/json_annotation.dart';
import 'package:lojavirtual/src/models/item_model.dart';


@JsonSerializable()
class CartItemModel {
  @JsonKey(name: 'product')
  ItemModel item;
  String id;
  int quantity;

  CartItemModel({
    required this.id,
    required this.item,
    required this.quantity,
  });

  

  @override
  String toString() =>
      'CartItemModel(item: $item, id: $id, quantity: $quantity)';
}