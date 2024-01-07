import 'dart:developer' as dev;

import 'package:flutter_hang_without_async/helper_functions.dart';

class MockApi {
  Future<bool> loginUser() async {
    // Simulate a network request or a long-running task.
    dev.log("Starting network call");
    await Future.delayed(getDelay());
    //sleep(getDelay());

    dev.log("Finished network call");

    return true;
  }
}
