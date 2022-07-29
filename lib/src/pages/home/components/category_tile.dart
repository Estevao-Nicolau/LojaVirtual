import 'package:flutter/material.dart';
import 'package:lojavirtual/src/config/theme_colors.dart';

class CategoryTiles extends StatelessWidget {
  const CategoryTiles(
      {Key? key,
      required this.category,
      required this.isSelected,
      required this.onPressed})
      : super(key: key);

  final String category;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                isSelected ? CustomColors.customSwathColor : Colors.transparent,
          ),
          child: Text(category,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : CustomColors.customContrastColor2,
                fontWeight: FontWeight.bold,
                fontSize: isSelected ? 16 : 14,
              )),
        ),
      ),
    );
  }
}
