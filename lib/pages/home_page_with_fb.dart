
import 'package:awesome_app/pages/login_page.dart';
import 'package:awesome_app/utils/constants.dart';
import 'package:awesome_app/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePageFB extends StatefulWidget {
  const HomePageFB({super.key});
  static const String routeName = '/home';

  @override
  State<HomePageFB> createState() => _HomePageFBState();
}

class _HomePageFBState extends State<HomePageFB> {
  // var myText = "Change My Name";
  // TextEditingController _nameController = TextEditingController();

  var url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
  var data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future fetchData() async {
    var res = await http.get(url);
    data = jsonDecode(res.body);
    return data;
  }

  @override
  void dispose() {
    super.dispose;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Awesome App',
        ),
        actions: [
          IconButton(onPressed: (){
            Constants.prefs.setBool('loggedIn', false);
            Navigator.pushReplacementNamed(context, LoginPage.routeName);
          }, icon: Icon(Icons.exit_to_app,),)
        ],
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Text('Fetch something'),
              );
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if(snapshot.hasError){
                  return Center(
                    child: Text('Some Error'),
                  );
                }
                return ListView.builder(itemBuilder: (context, index){
            return ListTile(
              title: Text(data[index]['title']),
              subtitle: Text('ID: ${data[index]['id']}'),
              leading: Image.network(data[index]['url']),
            );
          }, itemCount: data.length,);
          }
        },
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // myText = _nameController.text;
        },
        child: const Icon(Icons.send),
      ),
    );
  }
}
