import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lojavirtual/src/pages/orders/controller/order_controller.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  String id;

  @JsonKey(name: 'title')
  String itemName;

  @JsonKey(name: 'picture')
  String imgUrl;

  String unit;
  double price;
  String decription;

  ItemModel({
    this.id = '',
    required this.decription,
    required this.imgUrl,
    required this.itemName,
    required this.price,
    required this.unit,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemModelToJson(this);

  @override
  String toString() {
    return 'ItemModel(id: $id, itemName: $itemName, imgUrl: $imgUrl, unit: $unit, price: $price, description: $decription)';
  }
}