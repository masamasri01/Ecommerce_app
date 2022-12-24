// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project3/Auth/Auth_provider.dart';
import 'package:project3/data_repo/Auth_helper.dart';
import 'package:provider/provider.dart';

import 'package:project3/Admin/Views/components/product_widget.dart';
import 'package:project3/Admin/Views/screens/add_category.dart';
import 'package:project3/Admin/Views/screens/add_product.dart';
import 'package:project3/Admin/provider/admin_provider.dart';
import 'package:project3/App_Router/app_router.dart';

class AllProductsScreen extends StatelessWidget {
  String catId;
  AllProductsScreen({
    Key? key,
    required this.catId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: (Provider.of<AuthProvider>(context).loggedUser != null)
          ? Provider.of<AuthProvider>(context).loggedUser!.isAdmin
              ? AppBar(
                  actions: [
                    IconButton(
                        onPressed: () {
                          AppRouter.appRouter.goToWidget(AddNewProduct(catId));
                        },
                        icon: Icon(Icons.add))
                  ],
                  title: Text('All Products'),
                )
              : AppBar(
                  title: Text('All Products'),
                )
          : AppBar(
              title: Text('All Products'),
            ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return provider.allProducts == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                itemCount: provider.allProducts!.length,
                itemBuilder: (context, index) {
                  return ProductWidget(provider.allProducts![index]);
                },
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
              );
      }),
    );
  }
}
