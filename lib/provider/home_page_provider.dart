import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_login_screen_test/models/data_model.dart';

class HomePageProvider extends ChangeNotifier {
  late List<User> allUsers;
  late List<User> displayedUsers;
  TextEditingController searchController = TextEditingController();

  HomePageProvider() {
    fetchAndSortUsers();
  }

  Future<void> fetchAndSortUsers() async {
    List<User> users = await fetchLocalJson();
    users.sort((a, b) => a.name.compareTo(b.name));

    allUsers = users;
    displayedUsers = users;
    notifyListeners();
  }

  void searchUsers(String query) {
    displayedUsers = allUsers
        .where((user) => user.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  Future<List<User>> fetchLocalJson() async {
    String jsonString = await rootBundle.loadString('assets/users_list.json');

    Map<String, dynamic> data = json.decode(jsonString);
    List<dynamic> usersJson = data["Response"]["Users"];

    List<User> users =
        usersJson.map((userJson) => User.fromJson(userJson)).toList();

    return users;
  }
}
