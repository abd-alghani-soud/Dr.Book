import 'package:bookly_app/core/services/dependecies.dart';
import 'package:bookly_app/core/utils/request_status.dart';
import 'package:bookly_app/core/widgets/failed_widget.dart';
import 'package:bookly_app/core/widgets/loading_widget.dart';
import 'package:bookly_app/features/home/data/model/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/best_seller_item_widget.dart';
import 'package:bookly_app/features/search/presentation/controller/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomResultListView extends StatelessWidget {
  const CustomResultListView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      bloc: getIt<SearchCubit>(),
      builder: (context, state) {
        if (state.searchState == RequestStatus.success) {
          final bookModel = state.getBookFromSearch;
          return ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: state.getBookFromSearch.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: BestSellerItemWidgets(book: bookModel[index]),
              );
            },
          );
        } else if (state.searchState == RequestStatus.loading) {
          return LoadingWidget();
        } else if (state.searchState == RequestStatus.failed) {
          return FailedWidget(errorMessage: state.errorMessage);
        } else {
          return SizedBox();
        }
      },
    );
  }
}
