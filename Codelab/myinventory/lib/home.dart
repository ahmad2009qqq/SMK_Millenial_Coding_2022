import 'package:flutter/material.dart';

class Home extends StatelessWidget {
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
// generate dummy data
  final List dummyData = List.generate(50, (index) {
    return {
      "kode": "SH-2$index",
    };
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home',
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.home),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 5),
              child: Text(
                'Welcome',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                'Google name',
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                        padding: EdgeInsets.all(5),
                        child: Text('Product In',
                            style: const TextStyle(fontSize: 20)),
                      ),
                      Text('10', style: const TextStyle(fontSize: 50)),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_downward,
                  color: Colors.green,
                  size: 40,
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text('Product Out', style: const TextStyle(fontSize: 20)),
                      Text('4', style: const TextStyle(fontSize: 50)),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_upward,
                  color: Colors.red,
                  size: 40,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 7, bottom: 5),
              child: Text('Low Stock',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child:
                  Text('Stock Warning', style: const TextStyle(fontSize: 10)),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: //Image.asset('asset/shoes.jpg'),
                          Image.network(
                        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.QQnZ0yM4NlzHzSXhHt8qgwHaHa%26pid%3DApi&f=1",
                      ),
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
                            dummyData[index]["kode"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          // SizedBox(width: 10),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)),
                            onPressed: () {},
                            color: Colors.red,
                            textColor: Colors.white,
                            child: Text("Stock: 1",
                                style: TextStyle(fontSize: 12)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ), // ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        icon: Icon(Icons.add),
        label: Text('New Transaction'),
        backgroundColor: Colors.green,
        onPressed: () {},
      ),
    );
  }
}
