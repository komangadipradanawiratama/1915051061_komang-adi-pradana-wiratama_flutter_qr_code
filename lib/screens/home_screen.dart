import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import './webview_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String kode = "";
  var getKode;
  Future scanBarcode() async {
    getKode = await BarcodeScanner.scan();
    setState(() {
      kode = getKode.rawContent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[400],
        title: Text("QR Code Scanner"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          Image.asset(
              "assets/home.jpg"),
          SizedBox(
            height: 10.0,
          ),
          FlatButton(
            onPressed: () {
              scanBarcode();
            },
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    "SCAN NOW",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey[400],
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),

          Text(""),

          FlatButton(
            onPressed: kode == ""
                ? () {}
                : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebScreen(kode),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: kode == ""
                      ? Text(
                    "CODE URL",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  )
                      : Text(
                    kode,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey[400],
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
