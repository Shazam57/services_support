import 'package:flutter/material.dart';

class Error extends StatefulWidget {
  const Error({ Key? key }) : super(key: key);

  @override
  _ErrorState createState() => _ErrorState();
}

class _ErrorState extends State<Error> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("error"),
    );
  }
}