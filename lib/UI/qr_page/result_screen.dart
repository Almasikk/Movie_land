import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vk_copy/UI/qr_page/scanner.dart';
import 'package:vk_copy/localization/localizations.dart';



class ResultScreen extends StatelessWidget {
  final String code;
  final Function() closeScreen;
  const ResultScreen({Key? key,required this.code,required this.closeScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: IconButton(onPressed:(){
          closeScreen();
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back),),
        centerTitle: true,
        title: Text(MyLocalizations.ScanQr),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(data: code,size: 150,version: QrVersions.auto,),
            Text(MyLocalizations.ScanQr),
            SizedBox(height: 10,),
            Text("$code",textAlign: TextAlign.center,),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: (){
                Clipboard.setData(ClipboardData(text: code));
              },
              child: Text(MyLocalizations.copy),),
          ],
        ),
      ),
    );
  }
}
