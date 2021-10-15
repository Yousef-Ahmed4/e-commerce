import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:yousef/models/mainmodel.dart';

class ItemScreen extends StatefulWidget {
  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context,child ,MainModel controller){
          return  Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black, size: 30.0),
           backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: ListView(
          children: [
            Container(
              height: 300,
              child: Image(
                image: NetworkImage(controller.selectedproduct!.itemimage),
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
                      fontSize: 17.0,
                      )),
              subtitle: Text(controller.selectedproduct!.producteName,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold)),
              trailing: Text(controller.selectedproduct!.itemprice,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
            ),
            Text('   D2300-2-3-2',style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      )),
            Text(
              '\nsdfugvjdfgvhxckljbnviudfojgmnjkxchvnsdhvndfjkvhcnvbjdfidfjg  jvnxklcvujpsklfnhciksdjfmnkcxlv jsmkfniox;v5165sadfasfjofjsn o',
              softWrap: true,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        bottomSheet: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              
              mainAxisSize: MainAxisSize.max,
              children: [
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xfffe7334) , width: 1.6 )
                      ),
                      fixedSize: Size(100, 50),
                      backgroundColor: Colors.white),
                    child: IconButton(
                        icon: Icon(Icons.favorite_border,color:Color(0xfffe7334) ),
                        onPressed: (){},
                      ),
                      
                            ),
                 SizedBox(width: 13,),           
                TextButton(
                    onPressed: () {
                      controller.addToCart(controller.selectedproduct!);
                      
                    },
                    style: TextButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width/1.5, 50),
                      backgroundColor: Color(0xfffe7334) ),
                    child: Text('add to cart',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold)))
              ],
            ),
          ),
        ),
      );}
    );
  }
}
