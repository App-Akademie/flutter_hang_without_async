import 'dart:developer' as dev;
import 'dart:io';

import 'package:flutter_hang_without_async/helper_functions.dart';

class MockApi {
  bool loginUser() {
    // Simulate a network request or a long-running task.
    dev.log("Starting network call");

    sleep(getDelay());

    dev.log("Finished network call");

    return true;
  }
}
