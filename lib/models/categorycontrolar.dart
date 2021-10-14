import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:yousef/models/models.dart';



mixin CategoryControlar on Model{

  CategoryModel? _selectedCategory;
  CategoryModel get selectedCategory=>_selectedCategory!;
  


  List<CategoryModel>allCategories =[];

  gitData()async{

    http.Response _response =await http.get(Uri.parse('https://first-12b46-default-rtdb.firebaseio.com/category.json'));

    Map<String,dynamic> _data=json.decode(_response.body);

    _data.forEach((key, value) {
      CategoryModel _newCategory=CategoryModel(key, value['categoryName'], value['categoryImage'],[] ,value['itemsNumber']);

       value['productes'].forEach((i) {
        ProductModel _newProduct = ProductModel('i',i['producteName'], i['itemimage'],i['itemprice'], );

        _newCategory.Product.add(_newProduct);
      });
      

      allCategories.add(_newCategory);
      

    });
    notifyListeners();


  } 

}


