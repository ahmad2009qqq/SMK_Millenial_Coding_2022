import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProductAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: Main(title: 'Inventory'));
  }
}

class Main extends StatelessWidget {
  final String title;
  Main({Key? key, required this.title}) : super(key: key);

  File? image; // final _picker = ImagePicker();
  Future openGallery() async {
    final imageGallery =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    image = File(imageGallery!.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Transactions'),
        leading: BackButton(
          onPressed: () {},
          color: Colors.white,
          // icon: Icon(Icons.arrow_left_sharp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 10),
                child: Text('Product Information',
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              Text('Product Image',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 10, right: 5),
                child: ButtonTheme(
                  // Width: 200.0,
                  height: 80.0,
                  child: RaisedButton(
                    onPressed: () {
                      openGallery();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
              ),
              Text('Product Name',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 10, right: 5),
                child: TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Product Name",
                    hintText: "input your product name here",
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
              Text('Product ID',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 10, right: 5),
                child: TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Product ID",
                    hintText: "input your product ID here",
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
              Text('Price',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 10, right: 5),
                child: TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Product Price",
                    hintText: "input your product price here",
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
              Text('Stock',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 10, right: 5),
                child: TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Stock",
                    hintText: "input your stock here",
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
              Text('Description',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 10, right: 5),
                child: TextFormField(
                  minLines: 1,
                  maxLines: 5, // allow user to enter 5 line in textfield
                  decoration: new InputDecoration(
                    labelText: "Product Descripton",
                    hintText: "input your product description here",
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 10),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45.0),
                      side: BorderSide(color: Colors.blue)),
                  onPressed: () {
                    Navigator.pop(context, "product");
                  },
                  child: Text('Add Product', style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
