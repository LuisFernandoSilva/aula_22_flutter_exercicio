import 'package:aula_22_flutter_exercicio/data/mock_data.dart';
import 'package:aula_22_flutter_exercicio/pages/edit/reg_product_page.dart';
import 'package:aula_22_flutter_exercicio/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  static String routeName = '/items';

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    MockData.products = ModalRoute.of(context).settings.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos '),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamed(HomePage.routeName);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 16 / 9,
          ),
          itemCount: MockData.products.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(RegProductPage.routeName,
                    arguments: MockData.products[index]);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: FadeInImage(
                  placeholder: AssetImage("assets/loading.gif"),
                  image: AssetImage(MockData.products[index].photo),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
