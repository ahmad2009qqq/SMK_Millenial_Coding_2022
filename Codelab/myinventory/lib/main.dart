import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myinventory/home.dart';
import 'package:myinventory/product.dart';
import 'package:myinventory/transaction.dart';
// import 'package:myinventory/product_add.dart';
// import 'package:myinventory/product_add.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Training',
      // home: Main(),
      initialRoute: '/',
      routes: {
        '/': (context) => Main(),
        '/home': (context) => Home(),
        // '/product': (context) => Product(),
        // '/product_add': (context) => ProductAdd(),
        // '/product_edit': (context) => ProductAdd(),
        // '/transaction': (context) => Transaction(),
        // '/transaction_add': (context) => TransactionAdd(),
      },
    );
  }
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor:
            CupertinoTheme.of(context).barBackgroundColor.withOpacity(1.0),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Transactions',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return Home();
          // break;
          case 1:
            return Product();
          // break;
          case 2:
            return Transaction();
          // break;
          default:
            return Home();
        }
      },
    );
  }
}
