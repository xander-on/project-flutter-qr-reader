
import 'package:flutter/cupertino.dart';
import 'package:qr_reader/models/models.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scan) async {
  // final Uri url =  Uri.parse('https://flutter.dev');
  final Uri url =  Uri.parse(scan.valor);
  
  if( scan.tipo == 'http'){
    //abrir el sitio web
    if( !await launchUrl(url) ){
      throw 'Error al intentar acceder a: $url'; 
    }
  }else{
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
  
}