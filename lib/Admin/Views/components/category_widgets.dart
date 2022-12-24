import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:project3/Admin/Category.dart';
import 'package:project3/Admin/Views/screens/display_products.dart';
import 'package:project3/Admin/provider/admin_provider.dart';
import 'package:project3/App_Router/app_router.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  Category category;
  bool showControls;
  CategoryWidget(this.category, this.showControls);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        Provider.of<AdminProvider>(context, listen: false)
            .getAllProducts(category.id!);
        AppRouter.appRouter.goToWidget(AllProductsScreen(
          catId: category.id!,
        ));
      },
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.pink, width: 1)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
                  child: SizedBox(
                      width: double.infinity,
                      height: 170,
                      child: Image.network(
                        category.imageUrl,
                        fit: BoxFit.cover,
                      )),
                ),
                showControls
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
                                    Provider.of<AdminProvider>(context,
                                            listen: false)
                                        .deleteCategory(category);
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
                                  onPressed: () {
                                    Provider.of<AdminProvider>(context,
                                            listen: false)
                                        .goToEditCategoryPage(category);
                                  },
                                  icon: Icon(Icons.edit)),
                            ),
                          ],
                        ))
                    : Text('')
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        category.nameEn,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
