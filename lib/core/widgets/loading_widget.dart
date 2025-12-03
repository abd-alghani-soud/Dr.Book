import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.ok = true});

  final bool ok;

  @override
  Widget build(BuildContext context) {
    return ok
        ? Center(child: SpinKitFadingCircle(color: Colors.white, size: 80.0))
        : Center(
            child: SizedBox(
              width: 120,
              height: 120,
              child: _buildCircularShimmer(context),
            ),
          );
  }

  Widget _buildCircularShimmer(BuildContext context) {
    final base = Colors.grey.shade700;
    final highlight = Colors.grey.shade500;
    return Shimmer.fromColors(
      baseColor: base,
      highlightColor: highlight,
      period: const Duration(milliseconds: 900),
      direction: ShimmerDirection.ltr,
      child: Container(
        decoration: BoxDecoration(color: base, shape: BoxShape.circle),
      ),
    );
  }
}
