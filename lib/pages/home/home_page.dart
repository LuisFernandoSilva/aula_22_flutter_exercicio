import 'package:aula_22_flutter_exercicio/data/mock_data.dart';
import 'package:aula_22_flutter_exercicio/models/product.dart';
import 'package:aula_22_flutter_exercicio/pages/edit/reg_product_page.dart';
import 'package:aula_22_flutter_exercicio/pages/items/item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Home Opções'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              selected: true,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.grid_on),
              title: Text('Itens'),
              onTap: () {
                Navigator.of(context).pushNamed(ItemPage.routeName,
                    arguments: MockData.products);
              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Cadastro'),
              onTap: () {
                Navigator.of(context).pushNamed(
                  RegProductPage.routeName,
                  arguments: Product(
                    photo: 'assets/warning.png',
                    name: 'Escreva um nome',
                    description: 'Escreva uma descrição',
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sair'),
              onTap: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Home Store'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Seja Bem vindo\n ao Home Store',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
