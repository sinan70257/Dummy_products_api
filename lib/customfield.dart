import 'package:dog_image/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Column customField2(
    {required String label,
    required double height,
    required double width,
    required bool num,
    required bool max,
    required bool read,
    required String content}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      space10(),
      Text(
        " $label",
        style: GoogleFonts.sora(
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      space10(),
      Container(
        decoration: BoxDecoration(
          // color: Kgrey,
          borderRadius: BorderRadius.circular(10),
        ),
        height: height,
        width: width,
        child: customField(num, max, content, read),
      ),
    ],
  );
}

Widget customField(bool num, bool max, String content, bool read) {
  return TextFormField(
    minLines: 1,
    initialValue: content,
    readOnly: read,
    maxLines: max ? 10 : 1,
    keyboardType: num ? TextInputType.number : TextInputType.text,
    textAlignVertical: TextAlignVertical.center,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.transparent,
      border: InputBorder.none,
      hintStyle: GoogleFonts.inter(
          textStyle: const TextStyle(color: Color.fromARGB(255, 80, 80, 80))),
    ),
  );
}
