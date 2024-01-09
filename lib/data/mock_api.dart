import 'dart:developer' as dev;

import 'package:flutter_hang_without_async/helper_functions.dart';
import 'package:http/http.dart' as http;

class MockApi {
  Future<bool> loginUser() async {
    // Simulate a network request or a long-running task.
    dev.log("Starting network call");
    await Future.delayed(getDelay());
    //sleep(getDelay());

    dev.log("Finished network call");

    return true;
  }

  Future<String> fetchData() async {
    const url = 'https://hub.dummyapis.com/delay?seconds=5';

    // Daten von der API holen.
    final response = await http.get(Uri.parse(url));

    // Daten zurückgeben.
    return response.body;
  }
}
