import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project3/Admin/Views/screens/add_category.dart';
import 'package:project3/Admin/Views/screens/add_new_slider.dart';
import 'package:project3/Admin/Views/screens/display_categories.dart';
import 'package:project3/App_Router/app_router.dart';
import 'package:project3/Auth/Auth_provider.dart';
import 'package:project3/extra_ui/my_slider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isAdmin = Provider.of<AuthProvider>(context).loggedUser == null
        ? false
        : Provider.of<AuthProvider>(context).loggedUser!.isAdmin;

    return Scaffold(
      appBar: (Provider.of<AuthProvider>(context).loggedUser != null)
          ? Provider.of<AuthProvider>(context).loggedUser!.isAdmin
              ? AppBar(title: Text('Home Page'), actions: [
                  ///admin
                  ElevatedButton(
                      onPressed: () {
                        AppRouter.appRouter.goToWidget(AddNewSliderScreen());
                      },
                      child: Text('Slider +')),
                  ElevatedButton(
                      onPressed: () {
                        AppRouter.appRouter.goToWidget(AddNewCategory());
                      },
                      child: Text('Category +')),
                  IconButton(
                      onPressed: () {
                        Provider.of<AuthProvider>(context, listen: false)
                            .signOut();
                      },
                      icon: Icon(Icons.logout))
                ])
              : AppBar(title: Text('Home Page'), actions: [
                  ///not admin

                  IconButton(
                      onPressed: () {
                        Provider.of<AuthProvider>(context, listen: false)
                            .signOut();
                      },
                      icon: Icon(Icons.logout))
                ])
          : AppBar(title: Text('Home Page'), actions: [
              IconButton(
                  onPressed: () {
                    Provider.of<AuthProvider>(context, listen: false).signOut();
                  },
                  icon: Icon(Icons.shopping_bag)),
              IconButton(
                  onPressed: () {
                    Provider.of<AuthProvider>(context, listen: false).signOut();
                  },
                  icon: Icon(Icons.logout))
            ]),
      body: Column(
        children: [ImageSlideShow(), AllCategoriesWidget()],
      ),
    );
  }
}
