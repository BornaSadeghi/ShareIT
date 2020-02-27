import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Server',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Smart Shelf'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int val = 1;

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Welcome back, Borna", ),
              Text("How many items to borrow?", style: TextStyle(fontSize: 24),),
              TextField(keyboardType: TextInputType.numberWithOptions()),
              RaisedButton(
                shape: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(60))),
                child: Text("Make request"),
                onPressed: () {
                  Firestore.instance.document(path)
                },
              )
            ],
          ),
        ),
      ),
    );
  }


//  Future getData() async{
//    //var url = 'https://shareit-cupguardian.000webhostapp.com/a.php';
//    var url = 'https://shareit-cupguardian.000webhostapp.com/a.php';
//    http.Response response = await http.get(url);
//    print(http.Response);
//    print(response.body);
//  }

}