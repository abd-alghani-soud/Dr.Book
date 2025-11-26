import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.ok = true});

  final bool ok;

  @override
  Widget build(BuildContext context) {
    return ok
        ? Center(child: SpinKitFadingCircle(color: Colors.white, size: 80.0))
        : Center(child: SpinKitRotatingCircle(color: Colors.white, size: 40.0));
  }
}
