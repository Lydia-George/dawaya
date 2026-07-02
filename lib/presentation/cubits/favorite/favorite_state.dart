part of 'favorite_cubit.dart';

class FavoriteState {
  final List<FavoriteItemModel> items;
  final bool isLoading ;

  const FavoriteState({  this.items = const[],  this.isLoading = false});

  bool isFavorite (String productId) =>
      items.any((item) => item.productId == productId);

  FavoriteState copyWith({List<FavoriteItemModel>? items , bool? isLoading}){
    return FavoriteState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
    );
  }


}

