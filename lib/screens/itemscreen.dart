import 'package:flutter/material.dart';

class ItemScreen extends StatefulWidget {
  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            height: 300,
            child: Image(
              image: NetworkImage(
                  'https://cdn11.bigcommerce.com/s-un94uomkbw/images/stencil/500x659/products/971/2612/LS114__63742.1529326275.jpg?c=2'),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration:
                      BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration:
                      BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.green, shape: BoxShape.circle),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.yellow, shape: BoxShape.circle),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('corner sofa, 2-seat',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
            subtitle: Text('classic traditional',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold)),
            trailing: Text('\$1650,',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
          ),
          Text(
            'sdfugvjdfgvhxckljbnviudfojgmnjkxchvnsdhvndfjkvhcnvbjdfidfjgjvnxklcvujpsklfnhciksdjfmnkcxlv jsmkfniox;vn o',
            softWrap: true,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1.5)
                  ),
                  fixedSize: Size(100, 50),
                  backgroundColor: Colors.white),
                child: IconButton(
                    icon: Icon(Icons.favorite_border,color:Colors.black),
                    onPressed: (){},
                  ),
                  
                        ),
            TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width/1.35, 50),
                  backgroundColor: Colors.blueAccent ),
                child: Text('add to cart',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold)))
          ],
        ),
      ),
    );
  }
}
