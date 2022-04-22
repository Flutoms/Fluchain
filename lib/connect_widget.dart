
import 'package:flu_web_chain/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'metamask.dart';

class ConnectWidget extends StatelessWidget {
  const ConnectWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0Xff181818),
        body: Stack(
          children: [
            Positioned.fill(child: Image.asset('assets/background.png', fit: BoxFit.cover,)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthAdjusted(20)),
                  child:   Text('Send and receive cryptos in the most convenient way.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: SizeConfig.textAdjusted(50),
                          height: 1.3,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))
                ),
                SizedBox(height: SizeConfig.heightAdjusted(3)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthAdjusted(30)),
                  child: Text('Sending and receiving cryptos has never been easy, '
                      'here is world\'s best means of sending '
                      'and receiving cryptos.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: SizeConfig.textAdjusted(16),
                          color: Colors.white.withAlpha(100)))
                ),
                SizedBox(height: SizeConfig.heightAdjusted(4)),
                GestureDetector(
                  onTap: () => connectToMetamask(context: context),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Image.network(
                        'https://i0.wp.com/kindalame.com/wp-conten'
                            't/uploads/2021/05/metamask-fox-wordmark-'
                            'horizontal.png?fit=1549%2C480&ssl=1',
                        width: SizeConfig.imageAdjusted(20),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: SizeConfig.heightAdjusted(2)),
                Text('Click to connect...',
                    style: TextStyle(fontSize: SizeConfig.textAdjusted(14), color: Colors.white))
              ],
            )
          ],
        ));
  }
}