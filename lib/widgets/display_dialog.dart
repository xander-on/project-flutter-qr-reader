import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String title = 'Error al escanear codigo QR';
const String message = 'El codigo QR escaneado no es valido vuelva a intentar con otro'; 

void displayDialogIOS(BuildContext context){
  showCupertinoDialog(
    barrierDismissible: false,
    context: context, 
    builder: (context){
      return const AlertDialogIOS();
    }
  );
}

void displayDialogAndroid(BuildContext context){
  //function
  showDialog(
    barrierDismissible: false,
    context: context, 
    builder: (context){
      return const AlertDialogAndroid();
    }
  );
}


class AlertDialogIOS extends StatelessWidget {
  const AlertDialogIOS({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text(title),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
          SizedBox( height: 10 ),
          Icon(Icons.error_outline, size: 100, color: Colors.teal,)
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), 
          child: const Text('OK')
        )
      ],
    );
  }
}


class AlertDialogAndroid extends StatelessWidget {
  const AlertDialogAndroid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 5,
      title: const Text(title),
      shape: RoundedRectangleBorder( borderRadius: BorderRadiusDirectional.circular(15) ),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
          SizedBox( height: 10 ),
          Icon(Icons.error_outline, size: 100, color: Colors.teal,)
        ],
      ),
      
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), 
          child: const Text('OK')
        )
      ],
    );
  }
}

