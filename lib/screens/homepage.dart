import 'package:flutter/material.dart';
import 'package:yousef/data/demodata.dart';
import 'package:yousef/screens/category.dart';
import 'package:yousef/screens/itemscreen.dart';
import 'package:yousef/theme/theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
          IconButton(
            icon: Icon(Icons.shopping_bag),
            color: Colors.black,
            onPressed: () {},
          )
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
                width: 300,height: 50,
                child: TextField(
                  
                    decoration: InputDecoration(

                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                    ),
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
                          'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=400'))),
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
              itemCount: CategoryData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 100, width: 100,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=400'))),
                      // child: Image(image: NetworkImage('https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=400'),),
                    ),
                   Text(CategoryData[index]['category name']),
                    Text(CategoryData[index]['items number'])
                  ],
                );
              },
            ),
          ),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: CategoryData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 120, width: 120,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=400'))),
                      // child: Image(image: NetworkImage('https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=400'),),
                    ),
                    Text(CategoryData[index]['category name']),
                    Text(CategoryData[index]['items number'])
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
