// import 'dart:js';
// import 'dart:js_util';
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_web3/flutter_web3.dart';
//
// // import 'package:flutter_web3_provider/ethereum.dart';
// import 'package:http/http.dart';
// import 'package:js/js.dart';
// // import 'package:flutter_web3_provider/ethers.dart';
//
// const _operatingChain = 4;
// int _currentChain = -1;
//
// final currentAddress = StateProvider.autoDispose((ref) => '');
// final balance = StateProvider.autoDispose((ref) => 0.0);
//
// bool get isEnabled => ethereum != null;
//
// bool get isOperatingChain => _currentChain == _operatingChain;
//
// void getBalance(
//     {required BuildContext context, required String address}) async {
//   // Balance in wei
//   var weiBalance = (await provider!.getBalance(address)).toDouble();
//
//   // Convert weiBalance to Eth
//   var ethBalance = (weiBalance / pow(10, 18));
//   context.read(balance).state = ethBalance;
// }
//
// Future<void> connectToMetamask({required BuildContext context}) async {
//   if (isEnabled) {
//     final acc = await ethereum!.requestAccount();
//
//     String address = acc.first;
//
//     if (acc.isNotEmpty) context.read(currentAddress).state = address;
//     _currentChain = await ethereum!.getChainId();
//
//     getBalance(context: context, address: address);
//
//     // print('Address: ${acc.first}');
//     // print('Chain ID: $_currentChain');
//   }
// }
//
// Future<bool> isWalletConnected({required BuildContext context}) async {
//   // Works
//   //  final signer = provider!.getSigner();
//   return ethereum!.isConnected() && (await ethereum!.getAccounts()).isNotEmpty;
// }
//
// Future<void> disconnect({required BuildContext context}) async {
//   if (isEnabled) {
//     context.read(currentAddress).state = '';
//     context.read(balance).state = 0.0;
//     _currentChain = -1;
//   }
// }
//
// // Functional
// init({required BuildContext context}) async {
//   if (isEnabled) {
//     ethereum!.onAccountsChanged((accounts) {
//       disconnect(context: context);
//     });
//   } else {
//     ethereum!.onChainChanged((chainId) {
//       disconnect(context: context);
//     });
//   }
// }