import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  SearchBarWidget({super.key});

  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        initialValue: '',
        autofocus: true,
        focusNode: _focusNode,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.black54, size: 25),
          border: UnderlineInputBorder(borderSide: BorderSide.none),
          hintText: 'repository name, description, or owner username',
          hintStyle: TextStyle(fontSize: 11),
          labelStyle: TextStyle(color: Colors.black54, fontSize: 16),
          // contentPadding: EdgeInsets.only(left: 10, right: 10),
        ),
        keyboardType: TextInputType.text,
        onChanged: (value) {
          if (value.isEmpty) return;
          Timer(
            Duration(milliseconds: 400),
            () {
              _focusNode.unfocus();
            },
          );
        },
      ),
    );
  }
}
