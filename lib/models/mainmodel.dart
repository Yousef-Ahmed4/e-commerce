import 'package:scoped_model/scoped_model.dart';
import 'package:yousef/models/categorycontrolar.dart';
import 'package:yousef/models/models.dart';
import 'package:yousef/models/productcontrolar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class MainModel extends Model with CategoryControlar,ProductControlar{}