import 'dart:developer' as dev;
import 'dart:math' as math;

import 'package:flutter_hang_without_async/constants.dart';

class MockApi {
  Future<bool> loginUser() async {
    // Simulate a network request or a long-running task.
    dev.log("Starting network call");
    await Future.delayed(
        Duration(seconds: math.Random().nextInt(minimumDelaySeconds) + 4));
    dev.log("Finished network call");

    return true;
  }
}
