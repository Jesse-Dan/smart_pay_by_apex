// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';

StatefulBuilder appDropdownButton({
  required controller,
  required items,
  required String? value,
  void Function(String?)? onChanged,
  IconData? icon,
}) {
  return StatefulBuilder(builder: (context, putState) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        alignment: Alignment.bottomLeft,
        isDense: true,
        iconSize: 30.0,
        icon: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(
           icon?? Icons.arrow_drop_down_rounded,
            color: Colors.grey.withOpacity(.8),
            size: 35,
            opticalSize: 18,
          ),
        ),
        elevation: 4,
        onChanged: onChanged != null
            ? (val) {
                controller.text = val?.toString() ?? '';
                onChanged(val);
              }
            : null,
        style: const TextStyle(color: Colors.black),
        value: null,
        hint: const Text(''),
        isExpanded: true,
        items: items
            .map<DropdownMenuItem<String>>(
                (String? value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value ?? 'Country'),
                    ))
            .toList(),
      ),
    );
  });
}
