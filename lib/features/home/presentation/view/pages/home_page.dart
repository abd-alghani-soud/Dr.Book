import 'package:bookly_app/core/services/dependecies.dart';
import 'package:bookly_app/features/home/presentation/controller/cubits/home_cubit.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/home_body_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final bloc = getIt<HomeCubit>();
    bloc.getBestSellerBooks();
    bloc.getAllBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeBodyWidget());
  }
}
