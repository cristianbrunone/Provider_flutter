import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonBase extends StatelessWidget {
  final String name;
  var onTap;
  final double width;
  final double height;
  final Color color; // Nuevo parámetro para el color
  final Color textColor;

  ButtonBase(this.name, this.onTap,
      {this.width = 0,
      this.height = 0,
      this.color = const Color.fromARGB(255, 0, 53, 186),
      this.textColor = Colors.white,
      required void Function() onPressed})
      : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(26.0),
      child: InkWell(
        onTap: this.onTap,
        child: Container(
            height: height > 05 ? height : 45,
            padding: EdgeInsets.all(10),
            width: width > 0 ? width : null,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(14))),
            child: Center(
                child: Text(
              name,
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.bold, fontSize: 20),
            ))),
      ),
    );
  }
}
