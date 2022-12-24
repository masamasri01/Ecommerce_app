// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:project3/Admin/Views/screens/add_new_slider.dart';
import 'package:project3/Auth/Auth_provider.dart';
import 'package:provider/provider.dart';

import 'package:project3/Admin/Views/components/category_widgets.dart';
import 'package:project3/Admin/Views/screens/add_category.dart';
import 'package:project3/Admin/provider/admin_provider.dart';
import 'package:project3/App_Router/app_router.dart';

class AllCategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    bool isAdmin = Provider.of<AuthProvider>(context).loggedUser == null
        ? false
        : Provider.of<AuthProvider>(context).loggedUser!.isAdmin;

    return Expanded(
      child: Consumer<AdminProvider>(builder: (context, provider, w) {
        return provider.allCategories == null
            ? Center(
                child: Text('No Categories Found'),
              )
            : Expanded(
                child: ListView.builder(
                    itemCount: provider.allCategories!.length,
                    itemBuilder: (context, index) {
                      return CategoryWidget(
                          provider.allCategories![index], isAdmin);
                    }),
              );
      }),
    );
  }
}
