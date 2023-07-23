
// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/widgets/widgets.dart';

import '../providers/scan_list_provider.dart';
import '../utils/utils.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return FloatingActionButton(
      child: const Icon( Icons.filter_center_focus ),
      onPressed: () async{
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancelar', false, ScanMode.QR);

        if(barcodeScanRes == "-1") return;
        if(!barcodeScanRes.contains('http')){
          if(!barcodeScanRes.contains('geo:')){
            Platform.isAndroid 
            ? displayDialogAndroid(context) 
            : displayDialogIOS(context);
            return;
          }
        }

        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        
        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
        launchURL(context, nuevoScan);
      },
    );
  }
}