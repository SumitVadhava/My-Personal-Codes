import 'package:flutter/material.dart';
import 'package:api_practical/api.dart';

class UserPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => UserPageState();
}

class UserPageState extends State<UserPage>{
  final ApiService apiService = ApiService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  List<Map<String,dynamic>> users = [];

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  Future<void> loadUsers() async{
    try{
      final data = await apiService.getUsers();
      setState(() {
        users = data;
      });
    }
    catch(e){
      throw Exception("Can't load user");
    }
  }

  Future<void> addUser(String name,String email) async{
    try{
      if(name.isNotEmpty && email.isNotEmpty){
        await apiService.add(name, email);
        await loadUsers();
      }
    }
    catch(e){
      throw Exception("Error : $e");
    }
  }

  Future<void> deleteUser(String id) async{
    try{
      await apiService.delete(id);
      await loadUsers();
    }
    catch(e){
      throw Exception("Error: $e");
    }
  }

  void updateUser(Map<String,dynamic> user){
    _nameController.text = user['name'];
    _emailController.text = user['email'];

    showDialog(context: context, builder: (context){
       return AlertDialog(
         title: Text("Update User"),
         content: Column(
           mainAxisSize: MainAxisSize.min ,
           children: [
             TextField(
               controller: _nameController,
               decoration:  const InputDecoration(labelText: "Enter name..."),
             ),
             TextField(
               controller: _emailController,
               decoration:  const InputDecoration(labelText:  "Enter email"),
             )
           ],
         ),
         actions: [
           TextButton(onPressed: (){
             Navigator.pop(context);
             setState(() {

             });
             _nameController.clear();
             _emailController.clear();
           }, child: Text("Cancel")),
           TextButton(onPressed: () async{
             if(_nameController.text.isNotEmpty && _emailController.text.isNotEmpty){
               await apiService.update(user['id'], _nameController.text, _emailController.text);
               Navigator.pop(context);
               setState(() {

               });
               await loadUsers();
               _nameController.clear();
               _emailController.clear();
             }

           }, child: Text("Update"))
         ],
       );
    });
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar:  AppBar(title: Text("API CRUD")),
       body: Column(
         children: [
           Padding(
               padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration:  const InputDecoration(labelText: "Enter name..."),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration:  const InputDecoration(labelText: "Enter email..."),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(onPressed: (){addUser(_nameController.text,_emailController.text); _nameController.clear(); _emailController.clear();}, child: Text("Add"))
                ],
              ),

           ),
          Expanded(child: ListView.builder(itemCount: users.length , itemBuilder:(context,index){
            final user = users[index];
            return ListTile(
              title: Text(user['name']),
              subtitle: Text(user['email']),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(onPressed: ()=> updateUser(user) , child: Icon(Icons.edit)),
                  SizedBox(width: 10.0),
                  ElevatedButton(onPressed: () => deleteUser(user['id']), child: Icon(Icons.delete))
                ],
              ),
            );
          }))
         ]
      )
     );
  }
}