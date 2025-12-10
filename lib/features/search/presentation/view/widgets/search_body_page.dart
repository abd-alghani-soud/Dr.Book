import 'package:bookly_app/core/constants/strings.dart';
import 'package:bookly_app/core/services/dependecies.dart';
import 'package:bookly_app/core/utils/style.dart';
import 'package:bookly_app/core/widgets/main_text_field.dart';
import 'package:bookly_app/features/home/data/model/book_model.dart';
import 'package:bookly_app/features/search/presentation/controller/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/view/widgets/custom_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';

class SearchBodyPage extends StatelessWidget {
  SearchBodyPage({super.key,});

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTextField(
            onChanged: (String q) {
              getIt<SearchCubit>().getResultFromSearch(q);
            },
            controller: searchController,
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
