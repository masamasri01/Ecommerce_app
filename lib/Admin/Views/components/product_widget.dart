import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project3/Admin/Product.dart';
import 'package:project3/Admin/provider/admin_provider.dart';
import 'package:project3/Auth/Auth_provider.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  Product product;
  ProductWidget(this.product);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<AdminProvider>(builder: (context, provider, x) {
      return InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.pink, width: 2)),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    //  borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
                    child: SizedBox(
                        width: double.infinity,
                        height: 270,
                        child: Image.network(
                          product.imageUrl,
                          fit: BoxFit.cover,
                        )),
                  ),
                  (Provider.of<AuthProvider>(context).loggedUser == null
                          ? false
                          : Provider.of<AuthProvider>(context)
                              .loggedUser!
                              .isAdmin)
                      ? Positioned(
                          right: 15,
                          top: 10,
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: IconButton(
                                    onPressed: () {
                                      provider.deleteProduct(product);
                                    },
                                    icon: Icon(Icons.delete)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: IconButton(
                                    onPressed: () {}, icon: Icon(Icons.edit)),
                              ),
                            ],
                          ))
                      : Positioned(
                          right: 15,
                          top: 10,
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: IconButton(
                                    onPressed: () {
                                      provider.addProductToCart(
                                          product,
                                          Provider.of<AuthProvider>(context,
                                                  listen: false)
                                              .loggedUser!);
                                    },
                                    icon: Icon(Icons.shopping_bag)),
                              ),
                            ],
                          ))
                ],
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Product Name' + ': ' + product.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Price' + ': ' + product.price + "\$",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ]),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
