import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'size_config.dart';

class NotSupportedBrowserWidget extends StatelessWidget {
  const NotSupportedBrowserWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0Xff181818),
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset('assets/background.png', fit: BoxFit.cover,)),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthAdjusted(25)),
                child: Text('Switch to a supported browser to use this service',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        fontSize: SizeConfig.textAdjusted(50),
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              Container(
                width: double.infinity,
              )
            ],
          )
        ],
      ),
    );
  }
}


