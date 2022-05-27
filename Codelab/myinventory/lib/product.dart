import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:myinventory/page_routes.dart';
import 'package:myinventory/product_add.dart';

class Product extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Tutorials',
        home: Main());
    // initialRoute: '/',
    // routes: {
    //   '/': (context) => FirstRoute(),
    //   '/second': (context) => SecondRoute(),),
    // },
  }
}

/// This is the stateless widget that the main application instantiates.
class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Products'),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.home),
        ),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              // padding: const EdgeInsets.only(top: 10,),
              child: ListTile(
                leading: //Image.asset('asset/shoes.jpg'),
                    Image.network(
                  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.QQnZ0yM4NlzHzSXhHt8qgwHaHa%26pid%3DApi&f=1",
                ),
                // leading: Image.asset('asset/shoes.svg'),
                trailing: Icon(Icons.delete),

                title: Text(
                  "Brand New Shoes",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SH-231',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(width: 10),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)),
                      onPressed: () {},
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Text("Stock: 1", style: TextStyle(fontSize: 12)),
                    ),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        icon: Icon(Icons.add),
        label: Text('Tambah'),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ProductAdd()),
          );
          // Navigator.pushNamed(context, '/product_add');
        },
      ),
    );
  }
}
