import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:note_app/core/constants/color_constants.dart';

class NoteScreenController {
  static List notesList = [];
  static List<Color> colorList = [
    ColorConstants.primaryBlue,
    ColorConstants.primaryRed,
    ColorConstants.primaryGrey,
    ColorConstants.primaryGreen
  ];
  static void addNote({
    required String title,
    required String description,
    required String date,
    int colorIndex = 0,
  }) {
    notesList.add({
      "title": title,
      "description": description,
      "date": date,
      "colorIndex": colorIndex
    });
  }

  static void deleteNote(int index) {
    notesList.removeAt(index);
  }

  static void editNote({
    required int index,
    required String title,
    required String description,
    required String date,
    int colorIndex = 0,
  }) {
    notesList[index] = {
      "title": title,
      "description": description,
      "date": date,
      "colorIndex": colorIndex
    };
  }
}
