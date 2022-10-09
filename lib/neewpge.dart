import 'package:flutter/material.dart';

class link extends StatefulWidget {
  const link({Key? key}) : super(key: key);

  @override
  State<link> createState() => _linkState();
}

class _linkState extends State<link> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: TextButton(child: Text("SOme"),
      onPressed: (){},
      ),
      ),
      ),
    );
  }
}
