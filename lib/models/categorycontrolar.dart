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
       


       for (int i =0;i<value['productes'].length;i++){
         ProductModel _newProduct = ProductModel('$i',value['productes'][i]['producteName'], value['productes'][i]['itemimage'],value['productes'][i]['itemprice'], );
        _newCategory.Product.add(_newProduct);
       };




      /* value['productes'].forEach((i) {
        ProductModel _newProduct = ProductModel('i',i['producteName'], i['itemimage'],i['itemprice'], );

        _newCategory.Product.add(_newProduct);
      });*/
      

      allCategories.add(_newCategory);
      

    });
    notifyListeners();


  } 
 
ProductModel? selectedproduct;

  selectproduct(String productId){
    for (ProductModel product in selectedcategory!.Product){
      if(product.id==productId){
        selectedproduct=product;
        break;
      }
     notifyListeners();

  }
  }


  CategoryModel? selectedcategory;

  selectcategory(String categoryId){
    for (CategoryModel category in allCategories){
      if(category.id==categoryId){
        selectedcategory=category;
        break;
      }
     notifyListeners();

  }
  }
  

  List<ProductModel> cart=[];

  addToCart(ProductModel product)async{
    Map<String, dynamic> _data = {
      'productName' : product.producteName,
      'productImage' : product.itemimage,
      'productPrice' : product.itemprice
    };
     http.Response _res = await http.post(Uri.parse('https://first-12b46-default-rtdb.firebaseio.com/cart.json'), body: json.encode(_data));
    cart.add(product);
    notifyListeners();

  }

  removeFromCart(ProductModel product1)async{
    http.Response _res=await http.delete(Uri.parse('https://first-12b46-default-rtdb.firebaseio.com/cart.json'));
    cart.removeWhere((ProductModel product)  {
      return product1.id==product.id;

       });
           notifyListeners();

  }

  List<CategoryModel> findedCategories = [];
  List<ProductModel> findedPorducts = [];

  search(String word) {

    for(CategoryModel categoryModel in allCategories) {
      if(categoryModel.categoryName.contains(word)) {
        findedCategories.add(categoryModel);
      }
      for(ProductModel productModel in categoryModel.Product) {
        if(productModel.producteName.contains(word)) {
          findedPorducts.add(productModel);
        }
      }
    }

    notifyListeners();
  }
  

}


