import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscountOffer extends StatefulWidget {
  const DiscountOffer({super.key});

  @override
  State<DiscountOffer> createState() => _DiscountOfferState();
}

class _DiscountOfferState extends State<DiscountOffer> {
  Timer? _timer;

  int days = 10;
  int hours = 23;
  int minutes = 51;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      _updateTime();
    });
  }

  void _updateTime() {
    if (minutes > 0) {
      setState(() {
        minutes--;
      });
      return;
    }

    if (hours > 0) {
      setState(() {
        hours--;
        minutes = 59;
      });
      return;
    }

    if (days > 0) {
      setState(() {
        days--;
        hours = 23;
        minutes = 59;
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 380),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top image
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/images/discount.png',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) {
                        return Container(
                          width: double.infinity,
                          height: 150,
                          color: const Color(0xFFEAEAEA),
                          child: const Icon(
                            Icons.local_offer_outlined,
                            size: 50,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),

                  // Close button
                  Positioned(
                    top: 10,
                    right: 10,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 26,
                        height: 26,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Discount
              Text(
                '10% OFF',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  height: 1,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                'For all products',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 22),

              Text(
                'Hurry up to buy! Until the end of\nthe promotion left:',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 13,
                  height: 1.4,
                  color: const Color(0xFF333333),
                ),
              ),

              const SizedBox(height: 15),

              // Countdown
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: _timeBox(value: days, label: 'Days'),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _timeBox(value: hours, label: 'Hours'),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _timeBox(value: minutes, label: 'Minutes'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // Start shopping
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    child: Text(
                      'START SHOPPING',
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _timeBox({required int value, required String label}) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFF3F3F3),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Text(
            value.toString().padLeft(2, '0'),
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        const SizedBox(height: 5),

        Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontSize: 11,
            color: const Color(0xFF333333),
          ),
        ),
      ],
    );
  }
}
