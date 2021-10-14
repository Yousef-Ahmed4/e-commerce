import 'package:flutter/material.dart';



class CategoryModel{

  String id;
  String categoryName;
  String categoryImage;
  String itemsNumber;
  List<ProductModel> Product;

  CategoryModel(this.id, this.categoryName, this.categoryImage, this.Product,this.itemsNumber);
}


class ProductModel{
  String id;
  String producteName;
  String itemimage;
  String itemprice;

  ProductModel(this.id, this.producteName, this.itemimage,this.itemprice);
}
