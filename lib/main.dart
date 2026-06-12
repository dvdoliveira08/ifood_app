import 'package:flutter/material.dart';
import 'package:ifood_app/home.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(const Ifood());
}

class Ifood extends StatelessWidget {
  const Ifood({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ifood",
      theme: ThemeData(primarySwatch: Colors.red),

      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      
      home: const TelaInicial(),
    );
  }
}
