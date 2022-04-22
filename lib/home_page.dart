import 'package:flu_web_chain/metamask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'connect_widget.dart';
import 'not_supported_browser_widget.dart';
import 'send_and_recieve_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    init(context: context);

    return Consumer(builder: (context, watch, child) {
      var walletBalance = watch(balance).state;
      var walletAddress = watch(currentAddress).state;

      if(isEnabled){
        return FutureBuilder<bool>(
          future: isWalletConnected(context: context),
          builder: (BuildContext context, snapshot) {
            if (snapshot.data == true && walletAddress.isNotEmpty) {
              return SendAndRecieveWidget(
                  walletBalance: walletBalance, walletAddress: walletAddress);
            } else {
              return const ConnectWidget();
            }
          }
        );
      } else {
        return const NotSupportedBrowserWidget();
      }

    });
  }
}
