import 'package:flutter/material.dart';
import 'package:gdsc_sparklingthon/widgets/custom_popup.dart';

class VotedProvider with ChangeNotifier {
  bool _votedToday = false;

  String _myVote = 'winter';

  bool get votedToday => _votedToday;

  String get myVote => _myVote;

  void vote() {
    _votedToday = true;
    notifyListeners();
  }

  void voteFor(String idol, BuildContext context) {
    _votedToday = true;
    _myVote = idol;
    notifyListeners();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => VotedPopUp(), //FailPopUp(),
    );
  }

  void resetVote() {
    _votedToday = false;
    notifyListeners();
  }
}
