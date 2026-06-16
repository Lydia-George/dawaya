import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pharmacy_state.dart';

class PharmacyCubit extends Cubit<PharmacyState> {
  PharmacyCubit() : super(PharmacyInitial());
}
