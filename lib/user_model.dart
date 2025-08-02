import 'package:hive/hive.dart';
part 'user_model.g.dart';

//Classe model da entidade Usuario
@HiveType(typeId: 1)
class User{

  @HiveField(0)
  String email;

  @HiveField(1)
  String senha;


  User({required this.email, required this.senha});





}