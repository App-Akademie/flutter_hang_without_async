import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter_hang_without_async/constants.dart';

class MockApi {
  bool loginUser() {
    // Simulate a network request or a long-running task, between 4 and 7 seconds
    dev.log("Starting network call");
    sleep(Duration(seconds: math.Random().nextInt(minimumDelaySeconds) + 4));
    dev.log("Finished network call");

    return true;
  }
}
