import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CartSection extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Empty Notification",
        style: GoogleFonts.montserrat(fontSize: 22, color: Colors.black),
      ),
    );
  }
}
