import 'package:flutter/material.dart';
import 'package:lojavirtual/src/config/theme_colors.dart';

class QuantityWidget extends StatelessWidget {
  final int value;
  final String suffixText;
  final Function(int quantity) result;

  const QuantityWidget(
      {Key? key,
      required this.value,
      required this.suffixText,
      required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            _QuantityButtom(
              icon: Icons.remove,
              color: CustomColors.customContrastColor,
              onPressed: () {
                if(value == 1) return;
                int resultCount = value - 1;

                result(resultCount);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                '$value-$suffixText',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _QuantityButtom(
              icon: Icons.add,
              color: CustomColors.customContrastColor2,
              onPressed: () {
                int resultCount = value + 1;

                result(resultCount);
              },
            ),
          ],
        ));
  }
}

class _QuantityButtom extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;
  _QuantityButtom({
    Key? key,
    required this.color,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
