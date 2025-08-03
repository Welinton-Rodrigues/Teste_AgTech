import 'package:teste_vaga_agtech/main.dart';
import 'package:teste_vaga_agtech/user_service.dart';

import 'user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

//variaveis de controle e estado
TextEditingController _emailController = TextEditingController();
TextEditingController _senhaController = TextEditingController();

// instanciação da classe UserService para utilização dos metodos
UserService _userService = UserService();

List<Map<String, dynamic>> _items = [];

//instanciação do BD
final Box _userBox = Hive.box('userBox');
//logica da tela

void refreshItems() async{
  final data = await _userService.getUsers();// await adicionado 
  {
    setState(() {
      _items = data;
      
    });
  }
}

// deletar e recarregar
//Correção - estava faltando uma chave no bloco deleteAndRefresh
void _deleteAndRefresh(itemKey) async{
  await _userService.deleteUser(itemKey);
  if(mounted)ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Usuario Deletado com Sucesso')),);
   refreshItems();
}

@override
  void initState() {
    super.initState();
    refreshItems();
  }
//Adicionei o metodo dispose para limpar os controllers

    @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

//logica do formulario para cadastrar usuarios
//Correção - logica do formulario estava duplicada e a parte visual estava fora do bloco de código

  void _showForm(BuildContext ctx, int? itemKey) {
    if (itemKey != null) {
      final existingUser = _items.firstWhere((element) => element['key'] == itemKey);
      _emailController.text = existingUser['email'];
      _senhaController.text = existingUser['senha'];
    } else {
      _emailController.text = '';
      _senhaController.text = '';
    
showModalBottomSheet(
      context: ctx,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).viewInsets.bottom,
          top: 15,
          left: 15,
          right: 15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'E-mail')),
            const SizedBox(height: 10),
            TextField(controller: _senhaController, obscureText: true, decoration: const InputDecoration(labelText: 'Senha')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final newUser = User(email: _emailController.text, senha: _senhaController.text);

                if (itemKey == null) {
                  await _userService.createUser(newUser);
                } else {
                  await _userService.updateUser(itemKey, newUser);
                }

                refreshItems();
                Navigator.of(context).pop();
              },
              child: Text(itemKey == null ? 'Criar Novo' : 'Atualizar'),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  } 
  }

//Logica de desmonstração do botao pra aprecer o formulario 
//Correção - metodo widget Build estava com o começo duplicado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CRUD com Serviços')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context, null),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (_, index) {
          final currentUser = _items[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: ListTile(
              title: Text(currentUser['email']),
              subtitle: const Text('******'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(icon: const Icon(Icons.edit), onPressed: () => _showForm(context, currentUser['key'])),
                  IconButton(icon: const Icon(Icons.delete), onPressed: () => _deleteAndRefresh(currentUser['key'])),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}