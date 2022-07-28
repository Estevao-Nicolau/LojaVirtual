import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/src/config/theme_colors.dart';
import 'package:lojavirtual/src/home/components/category_tile.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> categories = [
    'Relógios',
    'Perfumes',
    'Cintos',
    'Óculos',
    'Pijamas',
    'Camisas',
    'Sapatos'
  ];

  String selectedCategory = 'Relógios';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar
      appBar: AppBar(
        backgroundColor: CustomColors.customSwathColor,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: TextStyle(fontSize: 30),
            children: [
              TextSpan(
                  text: 'Loja',
                  style:
                      TextStyle(color: CustomColors.customContrastColorLogo)),
              TextSpan(
                  text: 'Nicolau',
                  style: TextStyle(color: CustomColors.customContrastColor2)),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                badgeColor: CustomColors.customContrastColor,
                badgeContent: Text(
                  '2',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                child: Icon(Icons.shopping_cart,
                    color: CustomColors.customContrastColorLogo),
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          // Campo de pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                hintText: 'Pesquisa aqui...',
                prefixIcon: Icon(Icons.search,
                    color: CustomColors.customContrastColorLogo, size: 24),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    )),
              ),
            ),
          ),
          // Categorias
          Container(
            padding: EdgeInsets.only(left: 25),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return CategoryTiles(
                  onPressed: () {
                    setState(() {
                      selectedCategory = categories[index];
                    });
                  },
                  category: categories[index],
                  isSelected:  categories[index] == selectedCategory,
                );
              },
              separatorBuilder: (_, index) => SizedBox(width: 10),
              itemCount: categories.length,
            ),
          ),
          // Grid
        ],
      ),
    );
  }
}
