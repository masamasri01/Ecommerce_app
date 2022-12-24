import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:project3/Admin/Views/components/slider_widget.dart';
import 'package:project3/Admin/provider/admin_provider.dart';
import 'package:provider/provider.dart';

class ImageSlideShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(
      builder: (context, provider, child) {
        return ImageSlideshow(
          /// Width of the [ImageSlideshow].
          width: double.infinity,

          /// Height of the [ImageSlideshow].
          height: 200,

          /// The page to show when first creating the [ImageSlideshow].
          initialPage: 0,

          /// The color to paint the indicator.
          indicatorColor: Colors.pink,

          /// The color to paint behind th indicator.
          indicatorBackgroundColor: Colors.grey,

          // ignore: sort_child_properties_last
          children: provider.allSliders == null
              ? [
                  Image.network(
                      'https://www.bing.com/ck/a?!&&p=8a1c9d2f685295adJmltdHM9MTY3MTY2NzIwMCZpZ3VpZD0yZjZhMzYyZS02MThlLTYwYzgtMWJjMS0zYmUxNjU4ZTYzMWUmaW5zaWQ9NTU4MQ&ptn=3&hsh=3&fclid=2f6a362e-618e-60c8-1bc1-3be1658e631e&u=a1L2ltYWdlcy9zZWFyY2g_cT1JbWFnZSUyMFNsaWRlciUyMEZsdXR0ZXImRk9STT1JUUZSQkEmaWQ9QjlGOTQzMDE3RjYzNzE3QzAxNTlDOUVGMzU4QzNEQkQ3M0FCOEJDOQ&ntb=1')
                ]
              : provider.allSliders!.isEmpty
                  ? []
                  : provider.allSliders!.map((e) {
                      return Image.network(e.imageUrl!);
                    }).toList(),

          /// Called whenever the page in the center of the viewport changes.
          onPageChanged: (value) {
            //   print('Page changed: $value');
          },

          /// Auto scroll interval.
          /// Do not auto scroll with null or 0.
          autoPlayInterval: 10000,

          /// Loops back to first slide.
          isLoop: false,
        );
      },
    );
  }
}
