part of 'onboarding_cubit.dart';

 class OnboardingState {
  final int currentIndex;
 const OnboardingState({this.currentIndex = 0 });

 OnboardingState copyWith({int? currentIndex}){
   return OnboardingState(
     currentIndex:  currentIndex ?? this.currentIndex,
   );
 }


}
