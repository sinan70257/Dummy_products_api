import 'package:dog_image/constants/constants.dart';
import 'package:dog_image/model.dart';
import 'package:dog_image/product_tile.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: poductsScreen(),
    );
  }
}

class poductsScreen extends StatefulWidget {
  const poductsScreen({super.key});

  @override
  State<poductsScreen> createState() => _poductsScreenState();
}

class _poductsScreenState extends State<poductsScreen> {
  @override
  Widget build(BuildContext context) {
    sWidth = MediaQuery.of(context).size.width;
    sHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dummy Product API"),
      ),
      body: FutureBuilder<List<products>>(
        future: fetchdata(),
        builder: (context, snapshot) {
          final productList = snapshot.data;

          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 5,
              ),
              child: GridView.builder(
                itemCount: productList!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 2,
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    childAspectRatio: 0.65),
                itemBuilder: (context, index) {
                  final data = productList[index];
                  return productTile(data, context);
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("failed to fetch data"),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
