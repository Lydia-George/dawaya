part of 'home_cubit.dart';

class HomeState {
  final int currentBannerIndex;

  const HomeState({
    this.currentBannerIndex =0,});

  HomeState copyWith({int? currentBannerIndex}) {
    return HomeState(
      currentBannerIndex: currentBannerIndex ?? this.currentBannerIndex,
    );
  }
}
