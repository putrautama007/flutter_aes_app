import 'package:flutter/material.dart';
import 'package:cipher2/cipher2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter AES Encryption Example'),
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
  String plainText = 'Dicoba coba, ini datanya';
  String key = 'mi9olukn4hrb5gyh';
  String iv = 'UckeFqaIxpaerAj2';
  String enkrips = "";
  String encryptedString = "";
  String decrypt4edString = "";


  void _enkripsion() async {
    encryptedString =
        await Cipher2.encryptAesCbc128Padding7(plainText, key, iv);
    print("isi enkripsinya :$encryptedString");
  }

  void _dekription() async {
    decrypt4edString =
        await Cipher2.decryptAesCbc128Padding7("$encryptedString", key, iv);
    print("isi dekripnya: $decrypt4edString");
  }

  void _incrementCounter() {
    setState(() {
      _enkripsion();
      _dekription();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.only(top: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'hasil enkripsi : $encryptedString',
            ),
            Text(
              'hasil dekripsi : $decrypt4edString',
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
