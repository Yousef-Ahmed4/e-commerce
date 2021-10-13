import 'package:flutter/material.dart';
import 'package:yousef/data/demodata.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          IconButton(
            icon: Icon(Icons.shopping_bag),
            color: Colors.black,
            onPressed: () {},
          )
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
          itemCount: CategoryData.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  alignment: Alignment.topRight,
                  height: 200, width: 200,
                  margin: EdgeInsets.all(5),
                  child: IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: (){},
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=400'))),
                  // child: Image(image: NetworkImage('https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=400'),)
                ),
                Text(CategoryData[index]['category name']),
                Text(CategoryData[index]['items number'])
              ],
            );
          },
        ),
      ),
    );
  }
}
