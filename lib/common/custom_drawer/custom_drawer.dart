import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lojavirtual/common/custom_drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const <Widget>[
          DrawerTile(iconData: Icons.home, title: 'Inicio', page: 0),
          DrawerTile(iconData: Icons.list, title: 'Produtos',page: 1),
          DrawerTile(iconData: Icons.playlist_add_check, title: 'Meus Pedidos', page: 2,),
          DrawerTile(iconData: Icons.location_on, title: 'Loja', page: 3),
        ],
      ),
    );
  }
}
