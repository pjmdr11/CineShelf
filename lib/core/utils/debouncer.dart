import 'dart:async';
import 'dart:ui';

import 'package:injectable/injectable.dart';

@injectable
class Debouncer {
  final int? milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({this.milliseconds = 500});

  run(VoidCallback action, {time}) {
    if (null != _timer) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: time ?? milliseconds), action);
  }
}
