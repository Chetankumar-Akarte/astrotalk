import 'package:flutter/material.dart';

import '../helper/api.dart';
import '../models/relatives.dart';

class ProfileProvider extends ChangeNotifier {
  List<Relatives> profiles = [];
  bool isLoading = true;
  bool? isDeleted;
  String? isSaved;

  void getProfiles() async {
    profiles = await Api.getRelativeProfiles();
    isLoading = false;
    notifyListeners();
  }

  void deleteMember(String uuid) async {
    isDeleted = await Api.deleteMember(uuid);
    notifyListeners();
    isDeleted = null;
    notifyListeners();
    getProfiles();
  }

  void saveMember(Map<String, dynamic> body) async {
    isSaved = await Api.saveMember(body);
    notifyListeners();
    isSaved = null;
    notifyListeners();
    getProfiles();
  }
}
