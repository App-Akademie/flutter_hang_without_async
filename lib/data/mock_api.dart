import 'dart:developer' as dev;

import 'package:flutter_hang_without_async/helper_functions.dart';
import 'package:http/http.dart' as http;

class MockApi {
  Future<bool> loginUser() async {
    // Simulate a network request or a long-running task.
    dev.log("Starting login call");
    await Future.delayed(getRandomDelay());
    //sleep(getDelay());

    dev.log("Finished login call");

    return true;
  }

  Future<String> fetchData() async {
    const url = 'https://fakeresponder.com/?sleep=5000';

    dev.log("Starting network call");
    // Daten von der API holen.
    final response = await http.get(Uri.parse(url));
    dev.log("Finished network call");

    // Daten zurückgeben.
    return response.body;
  }

  Future<bool> logoutUser() async {
    // Simulate a network request or a long-running task.
    dev.log("Starting logout call");
    await Future.delayed(getRandomDelay());
    //sleep(getDelay());

    dev.log("Finished logout call");

    return false;
  }
}
