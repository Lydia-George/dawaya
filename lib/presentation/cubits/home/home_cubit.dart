
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());


  void changeBanner(int index){
    emit(state.copyWith(currentBannerIndex: index));
  }

}
