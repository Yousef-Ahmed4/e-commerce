import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:yousef/data/demodata.dart';
import 'package:yousef/models/mainmodel.dart';
import 'package:yousef/screens/itemscreen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      //builder: (context, child, AppController controller) {
        builder: (context,child ,MainModel controller){
          return   Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text('Category items',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          actions: [
            
          ],
          iconTheme: IconThemeData(color: Colors.black, size: 30.0),
        ),
        body: Container(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio:.75
            ),
            scrollDirection: Axis.vertical,
            itemCount: controller.cart.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: (){
                      controller.selectproduct(controller.cart[index].id);
                      Navigator.push(context, MaterialPageRoute(builder: (_){return ItemScreen();}));
                    },
                    child: Container(
                      alignment: Alignment.topRight,
                      height: 200, width: 200,
                      margin: EdgeInsets.all(5),
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: (){
                        controller.selectproduct(controller.cart[index].id);
                          controller.removeFromCart(controller.selectedproduct!);
                        },
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(controller.cart[index].itemimage))),
                      // child: Image(image: NetworkImage('https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=400'),)
                    ),
                  ),
                 // Text(CategoryData[index]['category name']),
                   Text(controller.cart[index].producteName),
                 // Text(CategoryData[index]['items number']),
                  Text(controller.cart[index].itemprice)
                ],
              );
            },
          ),
        ),
      );
        },
      
    );
  }
}
