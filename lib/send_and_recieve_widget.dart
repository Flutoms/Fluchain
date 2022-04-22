import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'size_config.dart';

class SendAndRecieveWidget extends StatefulWidget {
  SendAndRecieveWidget({
    Key? key,
    required this.walletBalance,
    required this.walletAddress,
  }) : super(key: key);

  final double walletBalance;
  final String walletAddress;

  @override
  State<SendAndRecieveWidget> createState() => _SendAndRecieveWidgetState();
}

class _SendAndRecieveWidgetState extends State<SendAndRecieveWidget> {
  late WebSocketChannel channel;
  var usdBalance = '\$';

  @override
  void initState() {
    channel = WebSocketChannel.connect(
      Uri.parse('wss://ws.coincap.io/prices?assets=ethereum'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0Xff181818),
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/background.png',
            fit: BoxFit.cover,
          )),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthAdjusted(4),
                      vertical: SizeConfig.heightAdjusted(2)),
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthAdjusted(2),
                      vertical: SizeConfig.heightAdjusted(1)),
                  decoration: BoxDecoration(
                      color: Colors.orange.withAlpha(20),
                      border: Border.all(color: Colors.purple),
                      borderRadius:
                          BorderRadius.circular(SizeConfig.widthAdjusted(30))),
                  child: Text(
                      '${widget.walletAddress.substring(0, 4)}...${widget.walletAddress.substring(widget.walletAddress.length - 4)}',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StreamBuilder(
                      stream: channel.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var jsonBody = jsonDecode(snapshot.data as String);
                          var ethereumPrice =
                              double.tryParse(jsonBody['ethereum']);
                          usdBalance = (ethereumPrice! * widget.walletBalance)
                              .toStringAsFixed(3);
                        }
                        return Column(
                          children: [
                            SizedBox(height: SizeConfig.heightAdjusted(2)),
                            Text('Balance',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: SizeConfig.textAdjusted(18),
                                    height: 1.3,
                                    color: Colors.white.withAlpha(100))),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    '${widget.walletBalance.toStringAsFixed(3)} ',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                        fontSize: SizeConfig.textAdjusted(90),
                                        height: 1.3,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Text('Eth',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                        fontSize: SizeConfig.textAdjusted(25),
                                        height: 1.3,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(usdBalance,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                        fontSize: SizeConfig.textAdjusted(30),
                                        height: 1.3,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Text(' USD',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                        fontSize: SizeConfig.textAdjusted(25),
                                        height: 1.3,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                              ],
                            ),
                            SizedBox(height: SizeConfig.heightAdjusted(5)),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.widthAdjusted(38)),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.widthAdjusted(1),
                                    vertical: SizeConfig.heightAdjusted(1)),
                                color: Colors.white,
                                child: QrImage(
                                  data: widget.walletAddress,
                                  version: QrVersions.auto,
                                  size: 200.0,
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton(
      {Key? key,
      required this.onTap,
      required this.buttonText,
      required this.color})
      : super(key: key);

  final String buttonText;
  final Color color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.widthAdjusted(2),
            vertical: SizeConfig.heightAdjusted(1)),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(SizeConfig.widthAdjusted(30))),
        child: Text(buttonText,
            style: GoogleFonts.poppins(
                fontSize: SizeConfig.textAdjusted(18),
                height: 1.3,
                fontWeight: FontWeight.w500,
                color: Colors.white)),
      ),
    );
  }
}
