
import 'package:dio/dio.dart';
import 'package:rest_api_with_getx/models/product.dart';

class NetworkService{
  static const baseUrl = "https://abroruz98.000webhostapp.com";
  static const TIME = 20;

  static Future<List<Product>> fetchProductList() async{
    var dio = Dio();
    Response response = await dio.get(baseUrl+ "/man_clothes/man_clothes").timeout(Duration(seconds: TIME));
    if(response.statusCode == 200) {
      List<Product> list = productFromJson(response.data);
      return list;
    }
      return null;

  }
}