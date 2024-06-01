import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modal/unsplash_modal.dart';

class UnsplashApi {
  Future<List<UnsplashModal>> getData() async {
    var url = Uri.parse("https://api.unsplash.com/photos?page=1");
    var headers = {
      'Authorization': 'Client-ID FXUilXHSUZBAMhCXIyH7wrQJjGrGGp2f3NESQMd_IGY'
    };
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      print("success");
      var decodedData = jsonDecode(response.body) as List;
      var data = decodedData.map((json) => UnsplashModal.fromJson(json)).toList();
      return data;
    } else {
      print("not success");
      return [];
    }
  }
}


