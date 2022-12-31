import 'package:http/http.dart' as http;
import 'package:untitled/model/products_models.dart';
import 'package:untitled/utilis/4.1%20my_string.dart';

class ProductServices{


 static Future<List<ProductsModel>> getProduct()async{
 var response= await http.get(Uri.parse('$baseUrl/products'));
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