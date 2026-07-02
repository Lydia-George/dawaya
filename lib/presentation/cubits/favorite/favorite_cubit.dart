import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawaya/data/models/favouriteItem/favorite_item_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteState()) {
    loadFavorites();
  }

  // Get FavCollection data from Firebase
  CollectionReference? get _favCollection {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return null;

    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('favorites');
  }

  Future<void> loadFavorites() async {
    final collection = _favCollection;
    if (collection == null) return;

    emit(state.copyWith(isLoading: true));
    final snapshot = await collection.get();
    final items = snapshot.docs
        .map(
          (doc) =>
              FavoriteItemModel.fromJson(doc.data() as Map<String, dynamic>),
        )
        .toList();
    emit(state.copyWith(items: items));
  }

  Future<void> toggleFavorites(FavoriteItemModel item) async {
    final collection = _favCollection;
    if (collection == null) return;

    if (state.isFavorite(item.productId)) {
      await collection.doc(item.productId).delete();
      final updated = state.items
          .where((i) => i.productId != item.productId)
          .toList();
      emit(state.copyWith(items: updated));
    } else {
      await collection.doc(item.productId).set(item.toJson());
      emit(state.copyWith(items: [...state.items, item]));
    }
  }

  void clear() {
    emit(const FavoriteState());
  }
}
