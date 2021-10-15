import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yousef/data/demodata.dart';
import 'package:yousef/models/mainmodel.dart';
import 'package:yousef/screens/cart.dart';
import 'package:yousef/screens/category.dart';
import 'package:yousef/screens/itemscreen.dart';
import 'package:yousef/theme/icons.dart';
import 'package:yousef/theme/theme.dart';
import 'package:scoped_model/scoped_model.dart';


class HomePage extends StatefulWidget {

   final MainModel controller;

  HomePage(this.controller);
  @override
  _HomePageState createState() => _HomePageState();
}


  
class _HomePageState extends State<HomePage> {

  TextEditingController searchController = TextEditingController();

    @override
   void initState() {
    widget.controller.gitData();
    super.initState();
   }

   bool expaned = false;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
       builder: (context,child ,MainModel controller){
         return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text('HOME',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          actions: [
            iconbag(context)
          ],
          iconTheme: IconThemeData(color: Colors.black, size: 30.0),
        ),
        drawer: Drawer(),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: [
                Container(
                  width: 300,height: expaned == false ? 70 : 300,
                  child: Column(
                    children: [
                      TextField(
    
                        
                          decoration: InputDecoration(
                           // focusedBorder: ,
                           
    
                            prefixIcon: Icon(Icons.search,color: Colors.black,),
                            hintText: 'search produce',
    
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                          ),
                          controller: searchController,
                          onTap: () {
                            setState(() {
                              expaned = true;
                            });
                          },
                          onEditingComplete: () {
                            setState(() {
                              expaned = false;
                            });
                          },
                          onChanged: (value) {
                            controller.findedPorducts.clear();
                            controller.findedCategories.clear();
                            controller.search(searchController.text);
                          },
                          ),
                        expaned == false ? SizedBox() : Container(
                              color: Colors.white,
                              height: 200.0,
                              child: ListView(
                                children: [
                                  Container(
                                    height: 75.0,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller.findedCategories.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          height: 100, width: 100,
                                          margin: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20.0),
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(controller.findedCategories[index].categoryImage))),
                                          // child: Image(image: NetworkImage('https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=400'),),
                                        );
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 75.0,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller.findedPorducts.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          height: 100, width: 100,
                                          margin: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20.0),
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(controller.findedPorducts[index].itemimage))),
                                          // child: Image(image: NetworkImage('https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=400'),),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) {return ItemScreen();}));
    
              },
              child: Container(
                height: 200, margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK6vwmxBQFQXyaNqp2reRwUy7jKlEjL8gRtA&usqp=CAU'))),
                // child: Image(image: NetworkImage('https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=400'),),
              ),
            ),
            ListTile(
              title: Text(
                'categories',
              ),
              trailing: Text('vew all'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {return CategoryPage();}));
              },
            ),
            Container(
              height: 150.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.findedCategories.isEmpty ? controller.allCategories.length : controller.findedCategories.length,
                itemBuilder: (context, index) {
                  if(controller.findedCategories.isEmpty) {
                    return Column(
                    children: [
                      Container(
                        height: 100, width: 100,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(controller.allCategories[index].categoryImage))),
                        // child: Image(image: NetworkImage('https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=400'),),
                      ),
                     Text(controller.allCategories[index].categoryName),
                      Text(controller.allCategories[index].itemsNumber)
                    ],
                  );
                  }else{
                    return Column(
                    children: [
                      Container(
                        height: 100, width: 100,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(controller.findedCategories[index].categoryImage))),
                        // child: Image(image: NetworkImage('https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=400'),),
                      ),
                     Text(controller.findedCategories[index].categoryName),
                      Text(controller.findedCategories[index].itemsNumber)
                    ],
                  );
                  }
                },
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.findedPorducts.isEmpty ? controller.allCategories.length : controller.findedPorducts.length,
                itemBuilder: (context, index) {
                  if(controller.findedPorducts.isEmpty) {
                      return Column(
                    children: [
                      Container(
                        height: 120, width: 120,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(controller.allCategories[index].categoryImage))),
                        // child: Image(image: NetworkImage('https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=400'),),
                      ),
                      Text(controller.allCategories[index].categoryName),
                      Text(controller.allCategories[index].itemsNumber)
                    ],
                  );
                  }else{
                    return Column(
                    children: [
                      Container(
                        height: 120, width: 120,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(controller.findedPorducts[index].itemimage))),
                        // child: Image(image: NetworkImage('https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=400'),),
                      ),
                      Text(controller.findedPorducts[index].producteName),
                      Text(controller.findedPorducts[index].itemprice)
                    ],
                  );
                  }
                },
              ),
            )
          ],
        ),
      );
       });
  }
}
