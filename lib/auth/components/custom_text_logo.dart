import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text.rich(
            TextSpan(
              style: TextStyle(
                fontSize: 40,
              ),
              children: [
                // Nome do App
                TextSpan(
                  text: 'Loja',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'Nicolau',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          // Animação do segundo titulo
          SizedBox(
            height: 30,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 25,
              ),
              child: AnimatedTextKit(
                pause: Duration.zero,
                repeatForever: true,
                animatedTexts: [
                  FadeAnimatedText('Camisas'),
                  FadeAnimatedText('Sapatos'),
                  FadeAnimatedText('Relógios'),
                  FadeAnimatedText('Cintos'),
                  FadeAnimatedText('Pijamas'),
                  FadeAnimatedText('Óculos'),
                  FadeAnimatedText('Perfumes'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
