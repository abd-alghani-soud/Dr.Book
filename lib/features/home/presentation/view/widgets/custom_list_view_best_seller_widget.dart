import 'package:bookly_app/core/services/dependecies.dart';
import 'package:bookly_app/core/utils/request_status.dart';
import 'package:bookly_app/core/widgets/failed_widget.dart';
import 'package:bookly_app/core/widgets/loading_widget.dart';
import 'package:bookly_app/features/home/presentation/controller/cubits/home_cubit.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/best_seller_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListViewBestSellerWidget extends StatelessWidget {
  const CustomListViewBestSellerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: getIt<HomeCubit>(),
      builder: (context, state) {
        if (state.getBestSellerState == RequestStatus.success) {
          return ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.getBestSellerBooks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: BestSellerItemWidgets(
                  book: state.getBestSellerBooks[index],
                ),
              );
            },
          );
        } else if (state.getBestSellerState == RequestStatus.loading) {
          return LoadingWidget();
        } else if (state.getBestSellerState == RequestStatus.failed) {
          return FailedWidget(errorMessage: state.errorMessage);
        }
        return SizedBox();
      },
    );
  }
}
