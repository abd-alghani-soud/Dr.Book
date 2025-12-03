import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bookly_app/core/utils/style.dart';
import 'package:bookly_app/features/home/data/model/book_model.dart';
import 'package:bookly_app/features/home/presentation/controller/cubits/home_cubit.dart';
import 'package:bookly_app/core/services/dependecies.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/book_actions.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/book_rating_widget.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/card_item_list_view_home_widget.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/custom_book_details_appbar.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/details_list_view_widgets.dart';

class BookDetailsPage extends StatefulWidget {
  final BookModel book;

  const BookDetailsPage({super.key, required this.book});

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  final ValueNotifier<bool> _isDescriptionExpanded = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    final category = (widget.book.volumeInfo.categories.isNotEmpty)
        ? widget.book.volumeInfo.categories[0]
        : '';

    final bloc = getIt<HomeCubit>();
    bloc.getSimilarBooks(category: category);
  }

  @override
  void dispose() {
    _isDescriptionExpanded.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = widget.book.volumeInfo.imageLinks.thumbnail;
    final title = widget.book.volumeInfo.title;
    final authors = (widget.book.volumeInfo.authors.isNotEmpty)
        ? widget.book.volumeInfo.authors.join(', ')
        : 'Unknown Author';
    final description =
        widget.book.volumeInfo.description ?? 'No Description Available';

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(child: CustomBookDetailsAppbar()),
              const SizedBox(height: 10),
              SizedBox(
                width: 200.w,
                child: CardItemListViewHomeWidget(
                  imageUrl: imageUrl,
                ),
              ),
              const SizedBox(height: 35),
              Text(title, style: Style.textSize26),
              const SizedBox(height: 6),
              Opacity(
                opacity: 0.5,
                child: Text(
                  authors,
                  style: Style.textSize18.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              BookRatingWidget(mainAxisAlignment: MainAxisAlignment.center),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: BookActions(),
              ),
              const SizedBox(height: 45),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'You can also like',
                  style: Style.textSize16.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              DetailsListViewWidgets(imageUrl: imageUrl),
              const SizedBox(height: 35),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Description',
                  style: Style.textSize16.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // ====== الوصف داخل ValueListenableBuilder ======
              ValueListenableBuilder<bool>(
                valueListenable: _isDescriptionExpanded,
                builder: (context, isExpanded, child) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1), // شفاف
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          description,
                          maxLines: isExpanded ? null : 3,
                          overflow: isExpanded
                              ? TextOverflow.visible
                              : TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            height: 1.4,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _isDescriptionExpanded.value = !isExpanded,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              isExpanded ? 'Read less' : 'Read more',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
