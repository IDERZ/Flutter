import "package:flutter/material.dart";
import "package:artlab/models/product.dart";
import 'package:artlab/logic/product_logic.dart';
import 'package:artlab/util/msg.dart';

class ProductsUI extends StatefulWidget {
  ProductsUI({Key key}) : super(key : key);

  @override
  ProductsUIState createState() => new ProductsUIState();
}

class ProductsUIState extends State<ProductsUI> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
	void initState() {
		super.initState();
    print('product list init...');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text("Product list"),        
      ), 
      body: new Container(
        child: new FutureBuilder (
          future: ProductLogic.list(),
          builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {            
            if (snapshot.hasError) print('error: ' + snapshot.error.toString());
            return snapshot.hasData
                ? ProductList(products: snapshot.data)
                : Center(child: CircularProgressIndicator());
          }
        ) 
      ) 
    );
  }
}

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({Key key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(      
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ListTile(
                  title: Text(products[index].name), 
                  leading: Icon(Icons.star_border),
                  onTap: () {MsgUtil.show(products[index].code + " - " + products[index].name, MsgType.TOAST, null);}

        );
      },
    );
  }
}
