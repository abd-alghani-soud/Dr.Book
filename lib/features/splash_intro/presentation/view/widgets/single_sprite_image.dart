import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleSpriteImage extends StatelessWidget {
  final String assetPath;
  final int index;
  final int total;

  const SingleSpriteImage({super.key,
    required this.assetPath,
    required this.index,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final singleWidthFraction = 1 / total;
        return ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Stack(
            children: [
              Positioned.fill(
                child: Transform.translate(
                  offset: Offset(-index * w, 0),
                  child: SizedBox(
                    width: w * total,
                    height: constraints.maxHeight,
                    child: Image.asset(
                      assetPath,
                      fit: BoxFit.cover,
                      width: w * total,
                      height: constraints.maxHeight,
                    ),
                  ),
                ),
              ),
              Container(color: Colors.black.withOpacity(0.10)),
            ],
          ),
        );
      },
    );
  }
}