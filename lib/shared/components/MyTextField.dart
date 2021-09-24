import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget MyTextField(
    TextEditingController controller,
    TextInputType keyboardType,
    String? Function(String?)? validator,
    final Function(String?)? onChanged,
    String labelText,
    IconData prefixIcon,
    bool obscureText,
    {IconData ?suffixIcon,final Function()? onPressedIcon}

    )=>
    TextFormField(
      //hadi dyal l password
      autocorrect: true,
      obscureText: obscureText,
      cursorColor: Color(0xFF11266c),
      controller: controller,
      keyboardType:keyboardType,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(

        labelText: labelText,
        prefixIcon:  Icon(prefixIcon,color: Color(0xFF11266c),),
        suffixIcon: suffixIcon != null ? IconButton(onPressed: onPressedIcon,icon: Icon(suffixIcon),color: Color(0xFF11266c),):Icon(suffixIcon,color: Colors.white,),
        labelStyle: TextStyle(
          color: Color(0xFF11266c),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(
            color: Color(0xFF11266c),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
        ),
        focusedErrorBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Color(0xFF11266c),
          ),
        ),
      ),

    );