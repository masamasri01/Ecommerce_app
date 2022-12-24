import 'package:flutter/material.dart';
import 'package:project3/Admin/Views/components/slider_widget.dart';
import 'package:project3/Admin/Views/screens/add_new_slider.dart';
import 'package:project3/Admin/provider/admin_provider.dart';
import 'package:project3/App_Router/app_router.dart';
import 'package:provider/provider.dart';

class AllSliderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('All Sliders'),
        actions: [
          IconButton(
              onPressed: () {
                AppRouter.appRouter.goToWidget(AddNewSliderScreen());
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Consumer<AdminProvider>(
        builder: (context, provider, u) {
          return provider.allSliders == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : provider.allSliders!.isEmpty
                  ? Center(
                      child: Text('No Sliders Found'),
                    )
                  : ListView.builder(
                      itemCount: provider.allSliders!.length,
                      itemBuilder: (context, index) {
                        return SliderWidget(provider.allSliders![index]);
                      });
        },
      ),
    );
  }
}
