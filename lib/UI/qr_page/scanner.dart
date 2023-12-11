import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:vk_copy/UI/qr_page/result_screen.dart';
import 'package:vk_copy/localization/localizations.dart';


const bgColor = Color(0xfffafafa);

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {

  bool isScanCompleted = false;
  bool isFlashOn = false;
  bool isFrontCamera = false;
  MobileScannerController controller = MobileScannerController();

  void closeScreen(){
    isScanCompleted = false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            setState(() {
              isFlashOn = !isFlashOn;
            });
            controller.toggleTorch();
          }, icon: Icon(Icons.flash_on,color: Colors.grey,)),
          IconButton(onPressed: (){
            setState(() {
              isFrontCamera = !isFrontCamera;
            });
            controller.switchCamera();
          }, icon: Icon(Icons.camera_front,color: Colors.grey,))
        ],
        iconTheme: IconThemeData(color: Colors.black87),
        centerTitle: true,
        title: Text(MyLocalizations.ScanQr),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(MyLocalizations.EnterQr),
                Text(MyLocalizations.LoadQr)
              ],
            )),
            Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    MobileScanner(
                      controller : controller,
                      allowDuplicates: true,
                      onDetect: (barcode,args) {
                        if(!isScanCompleted){
                          String code = barcode.rawValue ?? '___';
                          isScanCompleted = true;
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen(closeScreen: closeScreen,code: code,)));
                        }

                      },),

                  ],
                )),
            Expanded(child: Container(
              alignment: Alignment.center,
              child: Text(MyLocalizations.project),
            )),
          ],
        ),
      ),
    );
  }
}
