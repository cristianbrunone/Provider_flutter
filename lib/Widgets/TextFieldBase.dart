import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldBase extends StatefulWidget {
  final String name;
  bool _obscureText = true;
  final TextEditingController controller;
  final IconData? icon;
  final IconData? emailIcon; // Nuevo parámetro para el icono de email
  final bool obscureText;
  final double height;
  final String? Function(String?)? validator;
  final AutovalidateMode autovalidateMode;
  final VoidCallback? onToggleVisibility;

  TextFieldBase(
    this.name,
    this.controller, {
    this.obscureText = false,
    this.icon,
    this.emailIcon, // Agrega el nuevo parámetro al constructor
    required this.height,
    this.validator,
    required this.autovalidateMode,
    this.onToggleVisibility,
  });

  @override
  _TextFieldBaseState createState() => _TextFieldBaseState();
}

class _TextFieldBaseState extends State<TextFieldBase> {
  double containerHeight = 52.0;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      height: containerHeight,
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          TextFormField(
            controller: widget.controller,
            obscureText:
                widget.icon != null && widget.icon == Icons.visibility_off
                    ? _obscureText
                    : false,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.name,
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding:
                  EdgeInsets.only(left: 40), // Espacio para el icono
            ),
            validator: widget.validator,
            autovalidateMode: widget.autovalidateMode,
            onChanged: (value) {
              setState(() {
                containerHeight =
                    widget.validator != null && widget.validator!(value) != null
                        ? widget.height + 2
                        : widget.height;
              });
            },
          ),
          widget.icon != null
              ? Positioned(
                  left: 12,
                  child: InkWell(
                    onTap: () {
                      if (widget.onToggleVisibility != null) {
                        widget.onToggleVisibility!();
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      }
                    },
                    child: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.blue,
                    ),
                  ),
                )
              : SizedBox(),
          widget.emailIcon != null
              ? Positioned(
                  left: 12,
                  child: Icon(
                    widget.emailIcon,
                    color: Colors.blue,
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
