import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget DefaultButton({
  double width = double.infinity,
  required Function() function,
  required String text,
  bool isUpperCase = true,
  double radius = 20.0,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
    );



Widget DefaultTextForm(
    context, {
      required TextEditingController controller,
      required TextInputType keyboardType,
      required String label,
      required Function() onTap,
      Function(String?)? onChange,
      bool isPassword = false,
      String? Function(String?)? validate,
      IconData? preIcon,
      bool AutoFocus = false,
      String? prefixText,

    }) {
  final bool isactive = isPassword;
  isactive? isPassword = isPassword: null;


  return TextFormField(
    controller: controller,
    obscureText: isPassword,
    keyboardType: keyboardType,
    validator: validate,
    decoration: InputDecoration(
      prefixText: prefixText,
      labelText: label,
      prefixIcon: Icon(
        preIcon,
      ),

      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
      ),
    ),
  );
}

//changing password visibility
bool isPassword = true;
IconData? suffixIcon = Icons.visibility_off;
void changePassword(){

  isPassword =! isPassword;
  suffixIcon = isPassword ?Icons.visibility_off:Icons.visibility;
}


void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (Route<dynamic> route) => false,
);

String token='';