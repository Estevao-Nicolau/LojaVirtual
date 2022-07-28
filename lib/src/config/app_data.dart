import 'package:lojavirtual/src/models/item_model.dart';

// Relógio
ItemModel watch = ItemModel(
  itemName: 'Relógio',
  imageUrl:
      'https://cdn.pixabay.com/photo/2016/11/29/13/39/analog-watch-1869928__480.jpg',
  unit: 'unit',
  price: 5000.0,
  decription: 'Relógio de Pulso Masculino Esporte a Prova de Água ',
);
// Pijamas
ItemModel pajama = ItemModel(
  itemName: 'Pijama',
  imageUrl:
      'https://cdn.pixabay.com/photo/2015/09/22/12/10/robe-951477_1280.jpg',
  unit: 'unit',
  price: 78.0,
  decription: 'Pijama feminino rosa',
);
// Tenis
ItemModel shoes = ItemModel(
  itemName: 'Tenis',
  unit: 'par',
  imageUrl:
      'https://cdn.pixabay.com/photo/2013/07/12/18/20/shoes-153310__340.png',
  price: 250.0,
  decription: 'All Star Verde',
);
// Camisas
ItemModel shirts = ItemModel(
  itemName: 'Camisa',
  unit: 'unit',
  imageUrl:
      'https://cdn.pixabay.com/photo/2014/03/24/13/42/t-shirt-294078__480.png',
  price: 88.0,
  decription: 'Camiseta básica Amarela',
);
// Cintos
ItemModel belt = ItemModel(
  itemName: 'Cinto',
  unit: 'unit',
  imageUrl:
      'https://cdn.pixabay.com/photo/2013/06/16/21/56/belt-139757__340.jpg',
  price: 230.0,
  decription: 'Cinto de Couro Marrom',
);
// Óculos
ItemModel eyeglass = ItemModel(
  itemName: 'Óculos',
  unit: 'unit',
  imageUrl:
      'https://cdn.pixabay.com/photo/2016/03/27/19/33/sunset-1283872__340.jpg',
  price: 500.0,
  decription: 'Óculos de Sol Masculino ',
);
// Perfumes
ItemModel perfume = ItemModel(
  itemName: 'Perfume',
  unit: 'unit',
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
