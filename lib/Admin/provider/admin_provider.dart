import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart' hide Slider;
import 'package:image_picker/image_picker.dart';
import 'package:project3/Admin/Category.dart';
import 'package:project3/Admin/Product.dart';
import 'package:project3/Admin/Slider.dart';
import 'package:project3/Admin/Views/screens/edit_category.dart';
import 'package:project3/App_Router/app_router.dart';
import 'package:project3/Auth/models/appUser.dart';
import 'package:project3/data_repo/firestore_helper.dart';
import 'package:project3/data_repo/storage_helper.dart';

class AdminProvider extends ChangeNotifier {
  AdminProvider() {
    getAllCategories();
    getAllSliders();
  }
  String? requiredValidation(String? content) {
    if (content == null || content.isEmpty) {
      return "Required field";
    }
  }

  // add new category
  File? imageFile;
  TextEditingController catNameArController = TextEditingController();
  TextEditingController catNameEnController = TextEditingController();
  GlobalKey<FormState> categoryFormKey = GlobalKey<FormState>();
  pickImageForCategory() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  addNewCategory() async {
    if (imageFile != null) {
      if (categoryFormKey.currentState!.validate()) {
        // add category process
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StorageHelper.storageHelper
            .uploadNewImage("cats_images", imageFile!);
        Category category = Category(
            imageUrl: imageUrl,
            nameAr: catNameArController.text,
            nameEn: catNameEnController.text);

        String? id =
            await FirestoreHelper.firestoreHelper.addNewCategory(category);

        AppRouter.appRouter.hideDialoug();
        if (id != null) {
          category.id = id;
          allCategories!.add(category);
          notifyListeners();
          catNameArController.clear();
          catNameEnController.clear();
          imageFile = null;
          notifyListeners();
          AppRouter.appRouter
              .showCustomDialoug('Success', 'Your category has been added');
        }
      }
    } else {
      AppRouter.appRouter
          .showCustomDialoug('Error', 'You have to pick image first');
    }
  }

  // get cateogies
  List<Category>? allCategories;
  List<Product>? allProducts;
  List<Slider>? allSliders;
  getAllCategories() async {
    allCategories = await FirestoreHelper.firestoreHelper.getAllCategories();
    notifyListeners();
  }

  // delete category
  deleteCategory(Category category) async {
    AppRouter.appRouter.showLoadingDialoug();
    bool deleteSuccess =
        await FirestoreHelper.firestoreHelper.deleteCategoey(category.id!);
    if (deleteSuccess) {
      allCategories!.remove(category);
      notifyListeners();
    }
    AppRouter.appRouter.hideDialoug();
  }

  deleteProduct(Product pro) async {
    AppRouter.appRouter.showLoadingDialoug();
    bool? deleteSuccess =
        await FirestoreHelper.firestoreHelper.deleteProduct(pro);
    if (deleteSuccess) {
      allProducts!.remove(pro);
      notifyListeners();
    }
    AppRouter.appRouter.hideDialoug();
  }

  goToEditCategoryPage(Category category) {
    catNameArController.text = category.nameAr;
    catNameEnController.text = category.nameEn;
    AppRouter.appRouter.goToWidget(EditCategory(category));
  }

  updateCategory(Category category) async {
    AppRouter.appRouter.showLoadingDialoug();
    if (imageFile != null) {
      String imageUrl = await StorageHelper.storageHelper
          .uploadNewImage("cats_images", imageFile!);
      category.imageUrl = imageUrl;
    }
    Category newCategory = Category(
        id: category.id,
        imageUrl: category.imageUrl,
        nameAr: catNameArController.text.isEmpty
            ? category.nameAr
            : catNameArController.text,
        nameEn: catNameEnController.text.isEmpty
            ? category.nameEn
            : catNameEnController.text);

    bool? isUpdated =
        await FirestoreHelper.firestoreHelper.updateCategory(newCategory);

    if (isUpdated != null && isUpdated) {
      int index = allCategories!.indexOf(category);
      allCategories![index] = newCategory;
      imageFile = null;
      catNameEnController.clear();
      catNameArController.clear();
      notifyListeners();
      AppRouter.appRouter.hideDialoug();
      AppRouter.appRouter.hideDialoug();
    }
  }

  TextEditingController sliderTitleController = TextEditingController();
  TextEditingController sliderUrlController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  GlobalKey<FormState> addProductKey = GlobalKey();
  addNewProduct(String catId) async {
    if (imageFile != null) {
      if (addProductKey.currentState!.validate()) {
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StorageHelper.storageHelper
            .uploadNewImage("products_images", imageFile!);
        Product product = Product(
            imageUrl: imageUrl,
            name: productNameController.text,
            description: productDescriptionController.text,
            price: productPriceController.text,
            catId: catId);

        String? id =
            await FirestoreHelper.firestoreHelper.addNewProduct(product);

        AppRouter.appRouter.hideDialoug();
        if (id != null) {
          product.id = id;
          allProducts?.add(product);
          notifyListeners();
          productNameController.clear();
          productDescriptionController.clear();
          productPriceController.clear();
          imageFile = null;
          notifyListeners();
          AppRouter.appRouter
              .showCustomDialoug('Success', 'Your Product has been added');
        }
      }
    } else {
      AppRouter.appRouter
          .showCustomDialoug('Error', 'You have to pick image first');
    }
  }

  addProductToCart(Product pro, AppUser loggedUser) async {
    await FirestoreHelper.firestoreHelper.addProductToCart(pro, loggedUser);
  }

  getAllProducts(String catId) async {
    allProducts = null;
    notifyListeners();
    List<Product>? products =
        await FirestoreHelper.firestoreHelper.getAllProducts(catId);

    allProducts = products;
    notifyListeners();
  }

  getAllSliders() async {
    allSliders = await FirestoreHelper.firestoreHelper.getAllSliders();
  }

  AddNewSlider() async {
    if (imageFile != null) {
      AppRouter.appRouter.showLoadingDialoug();
      String imageUrl = await StorageHelper.storageHelper
          .uploadNewImage("Slider_images", imageFile!);
      Slider slider = Slider(
          imageUrl: imageUrl,
          title: sliderTitleController.text,
          url: sliderUrlController.text);

      String? id = await FirestoreHelper.firestoreHelper.addNewSlider(slider);

      AppRouter.appRouter.hideDialoug();
      if (id != null) {
        slider.id = id;
        allSliders?.add(slider);
        notifyListeners();
        sliderTitleController.clear();
        sliderUrlController.clear();

        imageFile = null;
        notifyListeners();
        AppRouter.appRouter
            .showCustomDialoug('Success', 'Your Slider has been added');
      }
    } else {
      AppRouter.appRouter
          .showCustomDialoug('Error', 'You have to pick image first');
    }
  }
}
