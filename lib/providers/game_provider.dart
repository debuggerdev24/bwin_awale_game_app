import 'package:flutter/material.dart';

class GameProvider with ChangeNotifier {
  String _selectedOpponent = "Earline R. Walk";
  String _amount = "200";

  final List<String> _quickAmounts = ["100", "500", "1000", "2000"];

  String get selectedOpponent => _selectedOpponent;
  String get amount => _amount;
  List<String> get quickAmounts => _quickAmounts;

  double get betAmount => double.tryParse(_amount) ?? 0;
  double get platformFee => betAmount * 0.05;
  double get potentialWinnings => (betAmount * 2) - platformFee;

  void updateAmount(String value) {
    _amount = value;
    notifyListeners();
  }

  void selectOpponent(String opponent) {
    _selectedOpponent = opponent;
    notifyListeners();
  }
}
