// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/core/constants/color_constants.dart';

class NoteScreenController {
  static List notesListKeys = [];
  static List<Color> colorList = [
    ColorConstants.primaryBlue,
    ColorConstants.primaryRed,
    ColorConstants.primaryGrey,
    ColorConstants.primaryGreen
  ];

  //hive refrence
  static var myBox = Hive.box("noteBox");
  //add note
  static getInitKeys() {
    notesListKeys = myBox.keys.toList();
  }

  static Future<void> addNote({
    required String title,
    required String description,
    required String date,
    int colorIndex = 0,
  }) async {
    await myBox.add({
      "title": title,
      "description": description,
      "date": date,
      "colorIndex": colorIndex
    });
    notesListKeys = myBox.keys.toList();
  }

  static Future<void> deleteNote(var key) async {
    await myBox.delete(key);
    notesListKeys = myBox.keys.toList();
  }

  static Future<void> editNote({
    required int key,
    required String title,
    required String description,
    required String date,
    int colorIndex = 0,
  }) async {
    
   await myBox.put(key, {
      "title": title,
      "description": description,
      "date": date,
      "colorIndex": colorIndex
    });
  }
}
