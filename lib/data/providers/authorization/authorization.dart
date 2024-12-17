import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scheduler/data/data.dart';

//
import 'package:shared_preferences/shared_preferences.dart';

/// User for testing
User testingUser = User(name: 'Mustafa', email: 'mustafa@test.com');

class AuthorizationProvider extends ChangeNotifier {
  /// The logged-in user now
  User? loggedInUser;

  // *****************************************************
  // ****************** Functionality ********************
  // *****************************************************

  /// is the user logged-in
  bool get isLoggedIn => loggedInUser != null;

  /// initializing Authorization. Must be called with the start of the application
  Future<void> init() async {
    await _loadLocalData();
  }

  /// login user. return true if succeeded else false
  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    // For testing. just check the testing users

    //
    bool result = false;

    if (testingUser.email == email) {
      result = true;
      loggedInUser = testingUser;

      // save
      _saveLocalData();
    }

    notifyListeners();
    return result;
  }

  /// logout the current user
  Future<bool> logoutUser() async {
    loggedInUser = null;

    _saveLocalData();

    notifyListeners();
    return true;
  }

  // *****************************************************
  // ******************** save data **********************
  // *****************************************************

  ///
  Future<void> _saveLocalData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (loggedInUser != null) {
      prefs.setString('user', jsonEncode(loggedInUser!.toJson()));
    } else {
      // delete it
      prefs.remove('user');
    }
  }

  /// load local data
  Future<void> _loadLocalData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? user = prefs.getString('user');

    if (user != null) {
      // Load user data
      loggedInUser = User.fromJson(jsonDecode(user));
    }
  }
}
