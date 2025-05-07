import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FinalViewState {
  final int innerCurrentPage;

  FinalViewState({required this.innerCurrentPage});

  FinalViewState copyWith({int? innerCurrentPage, int? outerCurrentPage}) {
    return FinalViewState(
      innerCurrentPage: innerCurrentPage ?? this.innerCurrentPage,
    );
  }
}

class FinalViewController extends StateNotifier<FinalViewState> {
  FinalViewController() : super(FinalViewState(innerCurrentPage: 0));

  final CarouselSliderController innerCarouselController =
      CarouselSliderController();

  void updateInnerPage(int index) {
    state = state.copyWith(innerCurrentPage: index);
  }

  void animateToInnerPage(int index) {
    innerCarouselController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}

final finalViewControllerProvider =
    StateNotifierProvider<FinalViewController, FinalViewState>(
      (ref) => FinalViewController(),
    );
