import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:untitled/model/products_models.dart';
import 'package:untitled/serves/category_serves.dart';

class CategoryController extends GetxController{
  var categoryNameList=<String>[].obs;
  var isCategoryLoading=false.obs;
  var isAllCategory=true.obs;
   var categoryList=<ProductsModel>[].obs;
  var categoryImageList=<String>[
    "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
    "https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
  ].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategorys();

  }
  void getCategorys()async{
    var categoryName=await CategoryServices.getCategory();
    try{
      isCategoryLoading(true);
      if(categoryName.isNotEmpty){
        categoryNameList.addAll(categoryName);
      }

    }
    finally{
      isCategoryLoading(false);
    }
  }

  getAllCategorys(String nameCategory)async{
    isAllCategory(true);
   categoryList.value= await AllCategoryServices.getAllCategory(nameCategory);

      isAllCategory(false);
    }

  getCategoryIndex(int index) async{
    var categoryAllName= await  getAllCategorys(categoryNameList[index]);

    if(categoryAllName!=null)
      {
        categoryList.value=categoryAllName;

      }

  }
}