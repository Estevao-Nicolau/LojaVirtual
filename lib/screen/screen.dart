import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lojavirtual/common/custom_drawer/custom_drawer.dart';
import 'package:lojavirtual/models/page_manager.dart';
import 'package:lojavirtual/screen/login/login_screen.dart';
import 'package:provider/provider.dart';

class Screen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          LoginScreen(),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text("Home"),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text("Home2"),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text("Home3"),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text("Home4"),
            ),
          ),
        ],
      ),
    );
  }
}