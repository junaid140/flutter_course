import 'dart:convert';

import 'package:http/http.dart'as http;

import '../../utill/app_constents.dart';
import '../models/user.dart';

class ApiServices{


  Future<List<User>> getAllUser()async{
    var response = await http.get(Uri.parse("${AppConstants.user}"));
    var jsonData = jsonDecode(response.body);
    List<User> allUsers = [] ;
    for(var data in jsonData){
      allUsers.add(User.fromJson(data));
    }
    return allUsers;
  }
  Future<User> getUser(id)async{
    var response = await http.get(Uri.parse("${AppConstants.user}/$id"));
    var jsonData = jsonDecode(response.body);
   User user = User.fromJson(jsonData);
    return user;
  }

}