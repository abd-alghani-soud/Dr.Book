import 'package:bookly_app/core/services/dependecies.dart';
import 'package:bookly_app/core/utils/request_status.dart';
import 'package:bookly_app/core/widgets/failed_widget.dart';
import 'package:bookly_app/core/widgets/loading_widget.dart';
import 'package:bookly_app/features/home/presentation/controller/cubits/home_cubit.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/card_item_list_view_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsListViewWidgets extends StatelessWidget {
  const DetailsListViewWidgets({required this.imageUrl, super.key});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: getIt<HomeCubit>(),
      builder: (context, state) {
        if (state.getSimilarBooksState == RequestStatus.success) {
          return SizedBox(
            height: 150.h,
            child: ListView.builder(
              itemCount: state.getSimilarBooks.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: CardItemListViewHomeWidget(imageUrl: state.getSimilarBooks[index].volumeInfo.imageLinks.thumbnail),
                );
              },
            ),
          );
        } else if (state.getSimilarBooksState == RequestStatus.failed) {
          return FailedWidget(errorMessage: state.errorMessage);
        } else if (state.getSimilarBooksState == RequestStatus.loading) {
          return LoadingWidget();
        } else {
          return SizedBox();
        }
      },
    );
  }
}
