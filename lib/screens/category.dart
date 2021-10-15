import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:yousef/data/demodata.dart';
import 'package:yousef/models/mainmodel.dart';
import 'package:yousef/screens/itemscreen.dart';
import 'package:yousef/screens/products.dart';
import 'package:yousef/theme/icons.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      //builder: (context, child, AppController controller) {
        builder: (context,child ,MainModel controller){
          return   Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text('Category',
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
        body: Container(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio:.75
            ),
            scrollDirection: Axis.vertical,
            itemCount: controller.allCategories.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: (){
                      controller.selectcategory(controller.allCategories[index].id);
                      Navigator.push(context, MaterialPageRoute(builder: (_){return CategoryItemPage();}));
                    },
                    child: Container(
                      alignment: Alignment.topRight,
                      height: 200, width: 200,
                      margin: EdgeInsets.all(5),
                      child: IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: (){},
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(controller.allCategories[index].categoryImage))),
                      
                    ),
                  ),
                 // Text(CategoryData[index]['category name']),
                   Text(controller.allCategories[index].categoryName),
                 // Text(CategoryData[index]['items number']),
                  Text(controller.allCategories[index].itemsNumber)
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
