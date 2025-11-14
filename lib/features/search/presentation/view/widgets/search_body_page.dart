import 'package:bookly_app/core/constants/strings.dart';
import 'package:bookly_app/core/utils/style.dart';
import 'package:bookly_app/core/widgets/main_text_field.dart';
import 'package:bookly_app/features/search/presentation/view/widgets/custom_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchBodyPage extends StatelessWidget {
  const SearchBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTextField(
            hint: 'search',
            borderColor: Colors.white,
            fillColor: Strings.kBackground,
            suffixIcon: Opacity(
              opacity: 0.6,
              child: Icon(FontAwesomeIcons.magnifyingGlass, size: 21.sp),
            ),
          ),
          const SizedBox(height: 16),
          Text('Result', style: Style.textSize22),
          const SizedBox(height: 16),
          Expanded(child: CustomResultListView()),
        ],
      ),
    );
  }
}
