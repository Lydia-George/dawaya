import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'onboarding_state.dart';


class OnboardingCubit extends Cubit<OnboardingState> {
  final PageController pageController = PageController();

  OnboardingCubit() : super(OnboardingState());


  void onPageChanged(int index) {
    emit(state.copyWith(currentIndex: index));
  }


  void nextPage() {
    if (!isLastPage) {
      pageController.nextPage(
          duration: Duration(microseconds: 400), curve: Curves.easeInOut);
    }
  }

  bool get isLastPage => state.currentIndex==3;


  @override
  Future<void> close(){
    pageController.dispose();
    return super.close();
  }
  }

