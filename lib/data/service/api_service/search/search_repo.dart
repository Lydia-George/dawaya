import 'package:dawaya/data/models/pharmacy/pharmacy_model.dart';
import 'package:dawaya/data/models/search/search_result_model.dart';
import 'package:dio/dio.dart';

class SearchRepo {
  final Dio _dio = Dio();
  static const String baseUrl ='https://DawayaFinalProject.pythonanywhere.com/api';

  /// -- search for product name in all available pharmacies
  Future<List<SearchResultModel>> searchAcrossPharmacies({
    required String query,
    required List<PharmacyModel> pharmacies,
}) async{
    final results = <SearchResultModel>[];

    // send requests to all pharmacies in one time
    final responses = await Future.wait(
        pharmacies.map((pharmacy) async{
      try{
        final response = await _dio.get('$baseUrl/pharmacies/${pharmacy.id}/products/}');
        final data = response.data as Map<String, dynamic>;
        final productsList = data['products'] as List;

        /// -- Filter (with name)
        final matched = productsList.where((p) {
          final name = (p['product_name'] ?? '').toString().toLowerCase();
          return name.contains(query.toLowerCase());
        });

        return matched.map((p) => SearchResultModel(
            productId: p['product_id'].toString(),
            productName: p['product_name'] ?? '',
            image: p['product_image'] ?? '',
            price: double.tryParse(p['price'].toString()) ?? 0.0,
            isAvailable: p['is_available'] ?? true,
            pharmacyId: pharmacy.id,
            pharmacyName: pharmacy.name)).toList();


    }catch(e){
        return <SearchResultModel>[];
      }

    }),
    );

    for(final list in responses){
      results.addAll(list);
    }
    return results;

  }

}