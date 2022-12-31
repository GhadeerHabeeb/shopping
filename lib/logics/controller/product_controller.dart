import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/model/products_models.dart';
import 'package:untitled/serves/product_serves.dart';


class ProductController extends GetxController
{
  var productsList=<ProductsModel>[].obs;
  var favoriteList=<ProductsModel>[].obs;
  var isLoading=true.obs;
  //search
  var searchList=<ProductsModel>[].obs;
  TextEditingController searchTextController=TextEditingController();
   
@override
void onInit(){
  super.onInit();
  getProducts();
}

void  getProducts() async{

 var products= await  ProductServices.getProduct();
 try{
   isLoading(true);
   if(products.isNotEmpty)
  {
    productsList.addAll(products);
  }
 }
 finally
 {
   isLoading(false);
 }
  }
  //logic Favorite screen
void ManageFavorites( int productId)
{
 var existingIndex= favoriteList.indexWhere((element) => element.id==productId);


  if(existingIndex>=0)
    {
      favoriteList.removeAt(existingIndex);
    }
  else {
    favoriteList.add(
        productsList.firstWhere((element) => element.id == productId));
  }
}
bool isFavorites(int productId)
{
   return favoriteList.any((element) => element.id==productId);
}

//search bar logic

void addSearchToList(String searchNamed)
{
   searchNamed=searchNamed.toLowerCase();

  searchList.value =productsList.where((search){
    var searchTitle=search.title.toLowerCase();
    var searchPrice=search.price.toString().toLowerCase();
    return searchTitle.contains(searchNamed)||
        searchPrice.contains(searchNamed);
  }).toList();
  update();
}
void ClearSearch()

{
searchTextController.clear();
addSearchToList("");
}

}