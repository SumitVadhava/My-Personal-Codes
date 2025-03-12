import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService{
  final String baseUrl = "https://67cfc72b823da0212a834d36.mockapi.io/apidata";

  Future<List<Map<String,dynamic>>> getUsers() async{
    try{
       final response = await http.get(Uri.parse(baseUrl));

       if(response.statusCode == 200){
         List data = json.decode(response.body);
         return List<Map<String,dynamic>>.from(data);
       }
       else{
          throw Exception("Can't load user");
       }
    }
    catch(e){
        throw Exception("Error :$e");
    }
  }

  Future<void> add(String name, String email) async{
    try{
      final response = await http.post(
          Uri.parse(baseUrl),
         headers: {'Content-Type': 'application/json'},
        body: json.encode({'name' : name,'email' : email})
      );

      if(response.statusCode != 201){
        throw Exception("User not added");
      }

    }
    catch(e){
       throw Exception("Error: $e");
    }
  }

  Future<void> update(String id, String name, String email) async{
    try{
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type':'application/json'},
        body: json.encode({'name' : name, 'email' : email})
      );

      if(response.statusCode != 200){
        throw Exception("User not updated:  ${response.body}");
      }
    }
    catch(e){
      throw Exception('Error: $e');
    }
  }

  Future<void> delete(String id) async{
    try{
      final response = await http.delete(
        Uri.parse('$baseUrl/$id'),
      );

      if(response.statusCode != 200){
        throw Exception("User not deleted");
      }
    }
    catch(e){
      throw Exception("Error: $e");
    }
  }
}