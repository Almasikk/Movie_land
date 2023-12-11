import 'package:flutter/material.dart';
import 'package:vk_copy/UI/qr_page/scanner.dart';
import 'package:vk_copy/localization/localizations.dart';


import 'generate_qr_code.dart';

class QrPage extends StatefulWidget {
  const QrPage({Key? key}) : super(key: key);

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(MyLocalizations.QRCode),
          backgroundColor: Colors.blue,
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => QRScanner()));
                });
              }, child: Text(MyLocalizations.ScanQr)),
              SizedBox(height: 40,),
              ElevatedButton(onPressed: (){
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => GenerateQrCode()));
                });
              }, child: Text(MyLocalizations.GenerateQr))
            ],
          ),
        )
    );
  }
}
