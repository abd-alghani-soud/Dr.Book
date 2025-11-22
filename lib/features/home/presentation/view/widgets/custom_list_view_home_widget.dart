import 'package:bookly_app/core/services/dependecies.dart';
import 'package:bookly_app/core/utils/request_status.dart';
import 'package:bookly_app/core/widgets/failed_widget.dart';
import 'package:bookly_app/core/widgets/loading_widget.dart';
import 'package:bookly_app/features/home/presentation/controller/cubits/home_cubit.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/card_item_list_view_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListViewHomeWidgets extends StatelessWidget {
  const CustomListViewHomeWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: getIt<HomeCubit>(),
      builder: (context, state) {
        if (state.getAllBooksState == RequestStatus.success) {
          return SizedBox(
            height: 250.h,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.getAllBooks.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CardItemListViewHomeWidget(
                    imageUrl: state
                        .getAllBooks[index]
                        .volumeInfo
                        .imageLinks
                        .thumbnail,
                  ),
                );
              },
            ),
          );
        } else if (state.getAllBooksState == RequestStatus.loading) {
          return LoadingWidget();
        } else if (state.getAllBooksState == RequestStatus.failed) {
          return FailedWidget(errorMessage: state.errorMessage);
        }
        return SizedBox();
      },
    );
  }
}
