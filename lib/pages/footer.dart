import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF111111),
      padding: const EdgeInsets.only(top: 45, bottom: 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _socialIcon(Icons.facebook),
              _socialIcon(Icons.camera_alt_outlined),
              _socialIcon(Icons.alternate_email),
              _socialIcon(Icons.email),
              _socialIcon(Icons.call),
            ],
          ),

          const SizedBox(height: 25),

          Wrap(
            alignment: WrapAlignment.center,
            spacing: 30,
            runSpacing: 12,
            children: [
              _footerLink('Home'),
              _footerLink('News'),
              _footerLink('About'),
              _footerLink('Contact Us'),
              // _footerLink('Our Team'),
            ],
          ),

          const SizedBox(height: 32),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: const BoxDecoration(
              color: Colors.black,
              border: Border(
                top: BorderSide(color: Color(0xFF777777), width: 1),
              ),
            ),
            child: Text(
              'Copyright ©2026, Designed by @Pronoy',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialIcon(IconData icon) {
    return Container(
      width: 34,
      height: 34,
      margin: const EdgeInsets.symmetric(horizontal: 7),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.black, size: 19),
    );
  }

  Widget _footerLink(String title) {
    return InkWell(
      onTap: () {},
      child: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 12,
          color: Colors.white70,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
