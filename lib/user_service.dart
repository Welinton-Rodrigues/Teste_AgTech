
import 'dart:core';

import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'user_model.dart';


//instanciação da variavel para conexão com banco de dados
final Box _userBox = Hive.box('userBox');


//classe de responsabilidade para os metodos CRUD
class UserService {

  //1.create
  Future<void> createUser(User newUser) async {
    await _userBox.add(newUser);
  }

  //2.Read
 List<Map<String,dynamic>> getUsers(){
  final data = _userBox.keys.map((key){
    final user = _userBox.get(key)as User;
    return {"key": key, "email":user.email,"senha":user.senha};
  }).toList();

  return data.reversed.toList();
}
     
   


  //3.update
  Future<void> updateUser(int itemKey, User user) async{
    await _userBox.put(itemKey, user);
  }

  Future<void> deleteUser(int itemKey) async{
    await _userBox.delete(itemKey);
  }








}