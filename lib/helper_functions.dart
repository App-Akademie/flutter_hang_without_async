import 'dart:math' as math;

import 'package:flutter_hang_without_async/constants.dart';

Duration getDelay() =>
    Duration(seconds: math.Random().nextInt(4) + minimumDelaySeconds);
