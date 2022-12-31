import 'package:http/http.dart' as http;
import 'package:untitled/model/category_model.dart';
import 'package:untitled/model/products_models.dart';
import 'package:untitled/utilis/4.1%20my_string.dart';

class CategoryServices{


  static Future<List<String>> getCategory()async{
    var response= await http.get(Uri.parse('$baseUrl/products/categories'));
    if(response.statusCode==200)
    {
      var jsonData=response.body;

      return categoryModelFromJson(jsonData);

    }
    else
    {
      return throw Exception("Faild to load prouducts");
    }
  }

}

class AllCategoryServices{


  static Future<List<ProductsModel>> getAllCategory(String CategoryNames)async{
    var response= await http.get(Uri.parse('$baseUrl/products/category/$CategoryNames'));
    if(response.statusCode==200)
    {
      var jsonData=response.body;

      return productsModelFromJson(jsonData);

    }
    else
    {
      return throw Exception("Faild to load prouducts");
    }
  }

}