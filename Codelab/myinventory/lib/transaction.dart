import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Transaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Tutorials',
        home: Main());
  }
}

/// This is the stateless widget that the main application instantiates.
class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);
  //sumber: https://www.sahretech.com/2022/02/cara-menggunakan-list-view-builder-di.html
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Transactions'),
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
                // leading: //Image.asset('asset/shoes.jpg'),
                //     Image.network(
                //   "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.QQnZ0yM4NlzHzSXhHt8qgwHaHa%26pid%3DApi&f=1",
                // ),
                // leading: Image.asset('asset/shoes.svg'),
                trailing: //Icon(Icons.delete),
                    Icon(
                  Icons.arrow_upward,
                  color: Colors.red,
                  size: 40,
                ),
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
                    ),
                    Text(
                      '20-Jan 2022 at 09:30',
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        icon: Icon(Icons.add),
        label: Text('Transaction'),
        backgroundColor: Colors.green,
        onPressed: () {},
      ),
    );
  }
}
