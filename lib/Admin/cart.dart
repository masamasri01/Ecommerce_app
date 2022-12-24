// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:project3/Admin/Product.dart';

class Cart {
  String? CartId;
  List<Product>? products;
  Cart({
    this.CartId,
    this.products,
  });
}
