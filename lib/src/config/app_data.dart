import 'package:lojavirtual/src/models/cart_item_model.dart';
import 'package:lojavirtual/src/models/item_model.dart';
import 'package:lojavirtual/src/models/order_model.dart';
import 'package:lojavirtual/src/models/user_model.dart';

// Relógio
ItemModel watch = ItemModel(
  itemName: 'Relógio',
  imageUrl:
      'https://cdn.pixabay.com/photo/2016/11/29/13/39/analog-watch-1869928__480.jpg',
  unit: 'Unid',
  price: 5000.0,
  decription: 'Relógio de Pulso Masculino Esporte a Prova de Água ',
);
// Pijamas
ItemModel pajama = ItemModel(
  itemName: 'Pijama',
  imageUrl:
      'https://cdn.pixabay.com/photo/2015/09/22/12/10/robe-951477_1280.jpg',
  unit: 'Unid',
  price: 78.0,
  decription: 'Pijama feminino rosa',
);
// Tenis
ItemModel shoes = ItemModel(
  itemName: 'Tenis',
  unit: 'Par',
  imageUrl:
      'https://cdn.pixabay.com/photo/2013/07/12/18/20/shoes-153310__340.png',
  price: 250.0,
  decription: 'All Star Verde',
);
// Camisas
ItemModel shirts = ItemModel(
  itemName: 'Camisa',
  unit: 'Unid',
  imageUrl:
      'https://cdn.pixabay.com/photo/2014/03/24/13/42/t-shirt-294078__480.png',
  price: 88.0,
  decription: 'Camiseta básica Amarela',
);
// Cintos
ItemModel belt = ItemModel(
  itemName: 'Cinto',
  unit: 'Unid',
  imageUrl:
      'https://cdn.pixabay.com/photo/2013/06/16/21/56/belt-139757__340.jpg',
  price: 230.0,
  decription: 'Cinto de Couro Marrom',
);
// Óculos
ItemModel eyeglass = ItemModel(
  itemName: 'Óculos',
  unit: 'Unid',
  imageUrl:
      'https://cdn.pixabay.com/photo/2016/03/27/19/33/sunset-1283872__340.jpg',
  price: 500.0,
  decription: 'Óculos de Sol Masculino ',
);
// Perfumes
ItemModel perfume = ItemModel(
  itemName: 'Perfume',
  unit: 'Unid',
  imageUrl:
      'https://cdn.pixabay.com/photo/2018/08/27/15/09/safe-3635196__480.jpg',
  price: 3000.0,
  decription: 'Perfume feminino ',
);

List<ItemModel> items = [
  watch,
  pajama,
  shoes,
  shirts,
  belt,
  eyeglass,
  perfume,
];
List<String> categories = [
  'Relógios',
  'Perfumes',
  'Cintos',
  'Óculos',
  'Pijamas',
  'Camisas',
  'Sapatos'
];

List<CartItemModel> cartItems = [
  CartItemModel(
    item: watch,
    quantity: 1,
  ),
  CartItemModel(
    item: pajama,
    quantity: 1,
  ),
  CartItemModel(
    item: perfume,
    quantity: 10,
  )
];

UserModel user = UserModel(
  name: 'Nicolau',
  email: 'nicolau@hotmail.com',
  phone: '11 9 0909-0909',
  password: '123456',
  cpf: '356.956.267-88',
);

List<OrderModel> orders = [
  // Pedido 01
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse('2023-09-03 10:00:10.458'),
    id: 'asd6a54da6s3d2',
    status: 'pending_payment',
    total: 11.0,
    overdueDateTime: DateTime.parse('2023-09-03 10:00:10.458'),
    items: [
      CartItemModel(
        item: shoes,
        quantity: 2,
      ),
      CartItemModel(
        item: pajama,
        quantity: 2,
      ),
    ],
  ),

  // Pedido 02
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5y3',
    createdDateTime: DateTime.parse('2023-09-03 11:00:10.458'),
    id: 'asd6a54da6s3d1',
    status: 'shipping',
    total: 11.0,
    overdueDateTime: DateTime.parse('2023-09-03 11:00:10.458'),
    items: [
      CartItemModel(
        item: perfume,
        quantity: 2,
      ),
    ],
  ),
];
